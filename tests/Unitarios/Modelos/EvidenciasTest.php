<?php

namespace Tests\Unitarios\Modelos;

use App\backend\Application\Utilidades\ArchivosTransformar;
use App\backend\Models\Evidencias;
use Tests\TestCase;

class EvidenciaTest extends TestCase
{
    private Evidencias $modeloEvidencias;
    private $datos;

    public function __construct()
    {
        parent::__construct();
    }

    protected function setUp(): void
    {
        $this->modeloEvidencias = new Evidencias;
    }
    
    /**
     * @covers App\backend\Models\Evidencias::obtenerEvidenciasPorPeriodo
     */
    public function testObtenerTodasEvidenciasPorUnPeriodoAcademico() {
        $evidencias = $this->modeloEvidencias->obtenerEvidenciasPorPeriodo('2022-2022','SOFT');
        $this->assertInstanceOf(\Illuminate\Support\Collection::class,$evidencias);
    }

    /**
     * @covers App\backend\Models\Evidencias::guardarEvidencia
     */
    public function testGuardarEvidenciaEnBase64() {
        $this->datos = [
            'pdf' => 'actualizado2'
        ];
        $result = $this->modeloEvidencias->guardarEvidencia('SOFT','2022-2022','1-AD-SOF 1.1.1.1',$this->datos);

        $this->assertTrue($result);
    }
    /**
     * @covers App\backend\Models\Evidencias::guardarEvidencia
     */
    public function testObtenerUnaEvidencia(){
        $evidencia = $this->modeloEvidencias->obtenerEvidenciaUnica('SOFT','2022-2022','1-AD-SOF 1.1.1.1');
        $this->assertCount(1,$evidencia);
    }
    /**
     * @covers App\backend\Models\Evidencias::obtenerEvidenciasPorPeriodoYResponsabilidades
     */
    public function testObtenerEvidenciasPorResponsabilidad(){
        $evidencia = $this->modeloEvidencias->obtenerEvidenciasPorPeriodoYResponsabilidades(
            '2022-2022',
            'SOFT',
            '0202468831'
        );
        $this->assertInstanceOf(\Illuminate\Support\Collection::class,$evidencia);
    }
}