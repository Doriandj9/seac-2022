<?php

declare(strict_types=1);

namespace App\backend\Application\Rutas;

use App\backend\Controllers\Coordinador\CambioClave;
use App\backend\Controllers\Coordinador\Docentes;
use App\backend\Controllers\Coordinador\Evidencias;
use App\backend\Controllers\Coordinador\Inicio;
use App\backend\Controllers\Coordinador\Notificaciones;
use App\backend\Controllers\Coordinador\Reportes;
use App\backend\Controllers\Coordinador\Responsable;
use App\backend\Frame\Route;
use App\backend\Models\Docente;

class RutasCoordinador implements Route
{
    public function getRoutes(): array
    {
        $inicioController = new Inicio;
        $docentes = new Docentes;
        $evidencias = new Evidencias;
        $responsables = new Responsable;
        $reportes = new Reportes;
        $notificaciones = new Notificaciones;
        $cambioClave = new CambioClave;
        return [
            'coordinador' => [
                'GET' => [
                    'controller' => $inicioController,
                    'action' => 'vista'
                ]
                ],
            'coordinador/docentes' => [
                'GET' => [
                    'controller' => $docentes,
                    'action' => 'vista'
                ]
                ],
            'coordinador/datos/docentes/carrera' => [
                'GET' => [
                    'controller' => $docentes,
                    'action' => 'listarDocentes'
                ],
            ],
            'coordinador/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'vista'
                ],
            ],
            'coordinador/registrar/docente' => [
                'POST' => [
                    'controller' => $docentes,
                    'action' => 'registar'
                ],
            ],
            'coordinador/datos/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'listarEvidenciasPorPeriodo'
                ],
            ],
            'coordinador/subir/evidencias' => [
                'POST' => [
                    'controller' => $evidencias,
                    'action' => 'registrar'
                ],
            ],
            'coordinador/listar/pdf/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'returnPDF'
                ],
            ],
            'coordinador/listar/word/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'returnWord'
                ],
            ],
            'coordinador/listar/excel/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'returnExcel'
                ],
            ],
            'coordinador/responsables' => [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'vista'
                ],
                'POST' => [
                    'controller' => $responsables,
                    'action' => 'registar'
                ]
            ],
            'coordinador/datos/responsables' => [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'listarResponsables'
                ],
            ],
            'coordinador/reporte/responsables' =>  [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'reporte'
                ]
                ],
            'coordinador/datos/responsabilidades' => [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'listarResponsabilidades'
                ],
            ],
            'coordinador/detalle/evidencias' => [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'detalleEvidencia'
                ],
            ],
            'coordinador/verificacion/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'verificacion'
                ],
            ],
            'coordinador/listar/verificacion/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'evidenciasPorPeriodoVerificar'
                ],
            ],
            'coordinador/registro/evaluadores' => [
                'POST' => [
                    'controller' => $responsables,
                    'action' => 'registarEvaluadores'
                ],
            ],
            'coordinador/listar/evaluadores' => [
                'GET' => [
                    'controller' => $responsables,
                    'action' => 'listarEvaluadores'
                ],
            ],
            'coordinador/registrar/verificacion' => [
                'POST' => [
                    'controller' => $evidencias,
                    'action' => 'registarVerificacion'
                ],
            ],
            'coordinador/reportes' => [
                'GET' => [
                    'controller' => $reportes,
                    'action' => 'vista'
                ],
            ],
            'coordinador/generar/reporte' =>  [
                'GET' => [
                    'controller' => $reportes,
                    'action' => 'generar'
                ]
                ],
            'coordinador/notificaciones' => [
                'GET' => [
                    'controller' => $notificaciones,
                    'action' => 'vista'
                ],
            ],
            'coordinador/obtener/notificaciones' => [
                'GET' => [
                    'controller' => $notificaciones,
                    'action' => 'listarNotificaciones'
                ],
            ],
            'coordinador/leido/notificaciones' => [
                'POST' => [
                    'controller' => $notificaciones,
                    'action' => 'leidoNotificacion'
                ],
            ],
            'coordinador/borrar/notificaciones' => [
                'POST' => [
                    'controller' => $notificaciones,
                    'action' => 'borrarNotificacion'
                ],
            ],
            'coordinador/enviar/notificaciones' => [
                'POST' => [
                    'controller' => $notificaciones,
                    'action' => 'enviarNotificacion'
                ],
            ],
            'coordinador/verficar/detalle/evidencias' => [
                'GET' => [
                    'controller' => $evidencias,
                    'action' => 'evidenciaVerificacion'
                ],
            ],
            'coordinador/cambio/clave' => [
                'GET' => [
                    'controller' => $cambioClave,
                    'action' => 'vista'
                ],
            ],
        ];
    }
    public function getTemplate(): string
    {
        return 'layout_coordinadores.html.php';
    }

    public function getRestrict(): array
    {
        return [
            'permisos' => Docente::COORDINADORES,
            'login' => true
        ];
    }
}
