<?php

declare(strict_types=1);

namespace App\backend\Models;


class DocentesCarreras extends DatabaseTable
{
    public const TABLE = 'docentes_carreras';

    public function __construct()
    {
        parent::__construct(self::TABLE, 'id_carreras');
    }
}
