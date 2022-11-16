<?php

namespace App\backend\Models;

use App\backend\Application\Utilidades\DB;

class Evidencias extends DatabaseTable
{
    public const TABLE = 'evidencias';
    private $carreraId;
    private $periodoId;
    private $results;
    public function __construct()
    {
        parent::__construct(self::TABLE,'id');
    }
    /**
     * @param string $periodoId es el id del perio a buscar las evidencias
     * @param string $carreraId es el id de la carrera que se van a buscar las evidencias
     * 
     * @return \Illuminate\Support\Collection coleccion de evidencias
     */
    public function obtenerEvidenciasPorPeriodo(string $periodoId,string $carreraId): \Illuminate\Support\Collection
    {
        $this->periodoId = $periodoId;
        $this->carreraId = $carreraId;
        $this->results = [];
        $this->chunk(50,function($evidencias) {
            foreach($evidencias as $evidencia) {
                array_push($this->results,$evidencia);
            }
        });
        $colection = new \Illuminate\Support\Collection($this->results);
        return $colection;

    }


     /**
    * Chunk the results of the query.
    *
    * @param  int  $count
    * @param  callable  $callback
    * @return bool
    */
    private function chunk($count, callable $callback)
   {
       $page = 1;

       do {
           // We'll execute the query for the given page and get the results. If there are
           // no results we can just break and return from here. When there are results
           // we will call the callback with the current chunk of these results here.
           $results = $this->querySelectEvidencias($page, $count);
           $countResults = count($results);

           if ($countResults == 0) {
               break;
           }

           // On each chunk result set, we will pass them to the callback and then let the
           // developer take care of everything within the callback, which allows us to
           // keep the memory low for spinning through large result sets for working.
           if ($callback($results, $page) === false) {
               return false;
           }

           unset($results);

           $page++;
       } while ($countResults == $count);

       return true;
   }

   private function querySelectEvidencias($page,$count): array
   {
    $pages = ($page - 1) * $count;
    $count = $count * $page;
    $evidencias = DB::select('
    select string_agg(criterios.nombre,\'---\') as nombre_criterio, 
    string_agg(estandar.descripcion,\'---\') as descripcion_estandar,
    string_agg(estandar.nombre,\'---\') as descripcion_estandar, 
    string_agg(estandar.tipo,\'---\') as tipo_estandar, 
    string_agg(elemento_fundamental.id,\'---\') as id_elemento,
    string_agg(elemento_fundamental.descripcion,\'---\') as descripcion_elemento, 
    string_agg(componente_elemento_fundamental.id_componente::text ,\'---\') as id_componente, 
    string_agg(componente_elemento_fundamental.descripcion ,\'---\') as descripcion_componente,
    string_agg(evidencias.nombre ,\'---\') as nombre_evidencias, 
    evidencias.id as id_evidencias
    from evidencias inner join carreras_evidencias on
    carreras_evidencias.id_evidencias = evidencias.id inner join 
    evidencia_componente_elemento_fundamental 
    on evidencia_componente_elemento_fundamental.id_evidencias = carreras_evidencias.id_evidencias inner join
    componente_elemento_fundamental on 
    componente_elemento_fundamental.id = evidencia_componente_elemento_fundamental.id_componente inner join 
    elemento_fundamental on elemento_fundamental.id = componente_elemento_fundamental.id_elemento inner join 
    estandar on estandar.id = elemento_fundamental.id_estandar inner join criterios 
    on criterios.id = estandar.id_criterio where carreras_evidencias.id_carrera = ? 
    and carreras_evidencias.id_periodo_academico = ?
    GROUP BY evidencias.id
    limit ? offset ?
    ',[$this->carreraId,$this->periodoId,$count,$pages]);

    return $evidencias;
   }
}