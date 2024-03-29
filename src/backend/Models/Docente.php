<?php

declare(strict_types=1);

namespace App\backend\Models;

use App\backend\Application\Utilidades\DB;

class Docente extends DatabaseTable
{
    public const TABLE = 'docentes';
    public const DOCENTES = 1;
    public const DIRECTOR_PLANEAMIENTO = 2;
    public const COORDINADORES = 4;
    public const EVALUADORES = 8;
    public const ADMIN = 16;
    private UsuariosDocente $usuarioDocente;

    public function __construct()
    {
        parent::__construct(self::TABLE, 'id');
    }
    public static function getUsuario($correo)
    {
        //Es una consulta que permite que saber que usuario quiere ingresar con su permisos
        $resultado = DB::table(self::TABLE)
        ->join('usuarios_docente', 'docentes.id', '=', 'usuarios_docente.id_docentes')
        ->join('usuarios', 'usuarios.id', '=', 'usuarios_docente.id_usuarios')
        ->get(['permisos','correo'])
        ->where('correo', '=', trim($correo))
        ->first();
        return $resultado;
    }

    public function getDocentesDeCarrera($id_carrera){
        $resultado = DB::table(self::TABLE)
        ->join('usuarios_docente','usuarios_docente.id_docentes','=','docentes.id')
        ->where('id_usuarios','=',self::DOCENTES)
        ->where('id_carrera','=',$id_carrera)
        ->get([
            'id_docentes','id_usuarios','nombre','apellido','correo','telefono',
            'fecha_inicial','fecha_final','estado'
        ]);

        return $resultado;
    }

    public static function tienePermisos($permisos): bool // retorna 0 o 1 que se trata como verdadero o falso
    {
        $usuario = DB::table(self::TABLE)
        ->join('usuarios_docente', 'docentes.id', '=', 'usuarios_docente.id_docentes')
        ->join('usuarios', 'usuarios.id', '=', 'usuarios_docente.id_usuarios')
        ->get(['permisos','correo'])
        ->where('correo', '=', trim($_SESSION['email']))
        ->where('permisos', '=', $permisos)
        ->first();
        if (isset($_SESSION['permiso'])) {
            return $permisos !== intval($_SESSION['permiso']) ? false : true;
        }
        return $usuario ?  true : false;
    }

    public static function getUsuarioCompleto(): \Illuminate\Support\Collection
    {
        //Es una consulta que permite que saber que usuario quiere ingresar con su permisos
        $resultado = DB::table(self::TABLE)
        ->join('usuarios_docente', 'docentes.id', '=', 'usuarios_docente.id_docentes')
        ->join('usuarios', 'usuarios_docente.id_usuarios', '=', 'usuarios.id')
        ->join('carreras', 'carreras.id', '=', 'usuarios_docente.id_carrera')
        ->get();
        return $resultado;
    }

    public function getTodosPermisos($id):\Illuminate\Support\Collection
    {
        $resultado = DB::table(self::TABLE)
        ->join('usuarios_docente', 'docentes.id', '=', 'usuarios_docente.id_docentes')
        ->join('usuarios', 'usuarios_docente.id_usuarios', '=', 'usuarios.id')
        ->get(['permisos','id_docentes'])
        ->where('id_docentes', '=', $id);
        return $resultado;
    }

    public function getCarrerasPorPermisos($id_usuarios, $id_docente)
    {
        $resultado = DB::table(Carreras::TABLE)
        ->join(UsuariosDocente::TABLE, UsuariosDocente::TABLE . '.id_carrera', '=', Carreras::TABLE . '.id')
        ->where('id_usuarios', '=', $id_usuarios)
        ->where('id_docentes', '=', $id_docente)
        ->where('carrera','=',null)
        ->orderBy('id_docentes')// nombre se refiere al nombre de la carrera
        ->get(['id_docentes','id_usuarios','id_carrera','nombre','fecha_inicial','fecha_final','estado']);
        $respuesta = $this->verificacionEstado($resultado);
        return empty($respuesta[1]) ? $respuesta[0]: $respuesta;
    }

    public function verificacionEstado(\Illuminate\Support\Collection $carreras): array
    {
        //definimos el tiempo de zona en guayaquil
        date_default_timezone_set('America/Guayaquil');
        $fecha_actual = new \DateTime('now');
        $this->usuarioDocente = new UsuariosDocente;
        $errores = [];
        foreach ($carreras as $key => $carrera) {
            $fecha_i =  new \DateTime($carrera->fecha_inicial);
            $fecha_f =  new \DateTime($carrera->fecha_final);
            $data_update = [
                'estado' => 'inactivo'
            ];

            if ($this->hasInterval($fecha_i, $fecha_f, $fecha_actual)) {
                $data_update['estado'] = 'activo';
                $carreras[$key]->estado = 'activo';
            } else {
                $carreras[$key]->estado = 'inactivo';
            }

            try {
                $this->usuarioDocente->updateUsuario($carrera->id_usuarios, $carrera->id_docentes, $data_update);
            } catch (\PDOException $e) {
                array_push($errores, [
                    'id_docentes' => $carrera->id_docentes,
                    'mensaje' => 'Ocurrio un error al intentar actualizar el estado',
                    'error' => $e->getMessage()
                ]);
            }
        }

        return [$carreras,$errores];
    }
    /**
     * Este metodo estatico permite verificar si una fecha en especifo se encentra dentro de un rango de fechas
     *
     * @param DateTime $start Es el intervalo inicial
     * @param DateTime $end Es el intervalo final
     * @param DateTime $date Es la fecha a comprobar si se encuentra en ese intervalo de $start a $end
     * @return bool
     */

    private function hasInterval(
        \DateTime $start,
        \DateTime $end,
        \DateTime $date
    ): bool {
        $start = new \DateTime($start->format('Y-m-d'));
        $end = new \DateTime($end->format('Y-m-d'));
        $date = new  \DateTime($date->format('Y-m-d'));
        $startInterval = $start->getTimestamp();
        $endInterval = $end->getTimestamp();

        return $date->getTimestamp() >= $startInterval && $date->getTimestamp() <= $endInterval;
    }

      /**
     * @param array<array> $datos
     */
    public function insertMasivo(array $datos){
        $columnas = ['nombres_doc' => 'nombre','apellidos_doc' => 'apellido','ci_doc' => 'id',
        'nick' => 'correo','celular' => 'telefono','cambio_clave' => 'cambio_clave','clave' => 'clave'];
        $queryMasive = 'INSERT INTO docentes (';
        foreach($columnas as $columna) {
            $queryMasive .=  $columna . ',';
        }
        $queryMasive = rtrim($queryMasive,',');
        $queryMasive .= ')VALUES(';
        foreach($datos as $dato) {
            $clave  = password_hash($dato['ci_doc'],PASSWORD_DEFAULT);
            $queryMasive .= '\'' . $dato['nombres_doc'] .'\'' . ',';
            $queryMasive .= '\'' . $dato['apellidos_doc'] .'\'' . ',';
            $queryMasive .= '\'' . $dato['ci_doc'] .'\'' . ',';
            $queryMasive .= '\'' . $dato['nick'] .'\''. ',';
            $queryMasive .= '\'' . $dato['celular'] .'\'' . ',';
            $queryMasive .= '1::boolean,';
            $queryMasive .= '\''. $clave .'\'';
            $queryMasive .= '),(';
        } 
        $queryMasive = rtrim($queryMasive,',(');
        $queryMasive .= ';';
        DB::statement($queryMasive);
    }
}
