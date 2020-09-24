<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PrizeRecord extends Model
{
    protected $table='prize_record';

    protected $fillable = ['user_id','prize_id','created_at'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'deleted_at',
    ];

    public function addRecord($userId, $prizeId)
    {
        return $this->create(
            [
                'prize_id'=>$prizeId,
                'user_id'=>intval($userId)
            ]
        );
    }
}
