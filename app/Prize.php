<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prize extends Model
{

    protected $table='prize';

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'deleted_at',
    ];
}
