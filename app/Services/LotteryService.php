<?php

namespace App\Services;

use App\Prize;
use App\User;
use App\PrizeRecord;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;


class LotteryService
{
    const USER_NOT_EXIST=10001; // 用户不存在
    const USER_HAD_LOTTERY=10002; // 用户已经抽过奖
    const ACTIVE_END=10003; //活动结束
    const USER_GOT_WAITE=10004; //服务忙
    const USER_GOT_PRIZE=1; //获取奖品
    const USER_NOT_GOT_PRIZE=2; //获取奖品

    const LOTTERY_TYPE_NORMAL=1; // 中奖模式1，普通随机抽奖。没有空奖，不控制概率
    const LOTTERY_TYPE_RATE=2;  //中奖模式2，根据配置奖品概率，让用户抽奖

    /**
     * 获取奖品
     * @param $userId
     * @param int $lotteryType 中奖模式。
     * @return array
     */
    public function getLottery($userId, $lotteryType=self::LOTTERY_TYPE_NORMAL)
    {
        $redisKey = 'getLottery_'.$userId;
        $redisVal = Redis::get($redisKey);
        if(!$redisVal) {
            Redis::set($redisKey, 1);
            $userIsExist = User::where(['id'=>intval($userId)])->first();
            if(!empty($userIsExist->id)) {
                $userRecord = PrizeRecord::where(['deleted_at'=>null, 'user_id'=>intval($userId)])->first();
                if($userRecord) {
                    // 查询所有奖品id
                    $prizeList = Prize
                        ::where(['deleted_at'=>null, ['inventory','>', 0]])
                        ->orderBy('id','asc')
                        ->get();
                    // 奖品没有，活动结束
                    if(empty($prizeList->toArray())) {
                        $logInfo = 'prize empty '.$userId;
                        Log::info($logInfo);
                        $result = ['msg'=>'活动已经结束', 'code'=>self::ACTIVE_END];
                    } else {
                        $prizeMapping = array_column($prizeList->toArray(), 'prize', 'id');
                        if($lotteryType == self::LOTTERY_TYPE_NORMAL) {
                            // 普通随机抽奖,不控制概率
                            $prizeId = $this->normalLottery($prizeList);
                        } elseif($lotteryType == self::LOTTERY_TYPE_RATE) {
                            // 根据配置的抽奖概率来抽奖
                            $prizeId = $this->rateLottery($prizeList);
                        } else {
                            $prizeId = 0;
                        }
                        if(isset($prizeMapping[$prizeId])) {
                            // 新增抽奖记录
                            $prizeName = $prizeMapping[$prizeId];
                            $prizeRecordModel = new PrizeRecord();
                            $result = $prizeRecordModel->addRecord($userId,$prizeId);
                            if($result) {
                                // 减库存
                                $prizeModel = new Prize();
                                $prizeModel->where(['id'=>$prizeId])->decrement('inventory');
                                $logInfo = 'user get prize userId:'.$userId.' prizeId: '.$prizeId;
                                Log::info($logInfo);
                                $result = ['msg'=>'恭喜你获得'.$prizeName, 'code'=>self::USER_GOT_PRIZE];
                            }
                        } else {
                            $logInfo = 'user get prize userId:'.$userId.' prizeId: '.$prizeId;
                            Log::info($logInfo);
                            $result = ['msg'=>'很遗憾，你没有获奖', 'code'=>self::USER_NOT_GOT_PRIZE];
                        }
                    }
                } else {
                    $logInfo = 'user have lottery userId:'.$userId;
                    Log::info($logInfo);
                    $result = ['msg'=>'您已抽过奖', 'code'=>self::USER_HAD_LOTTERY];
                }
            } else {
                $logInfo = 'user not exist userId:'.$userId;
                Log::info($logInfo);
                $result = ['msg'=>'用户不存在', 'code'=>self::USER_NOT_EXIST];
            }
        } else {
            $logInfo = 'service busy :'.$userId;
            Log::info($logInfo);
            $result = ['msg'=>'服务忙', 'code'=>self::USER_GOT_WAITE];
        }
        Redis::del($redisKey,'');
        return $result;
    }

    /**
     * 普通抽奖模式
     * @param $prizeList
     * @return mixed
     */
    public function normalLottery($prizeList)
    {
        $prizePool = [];
        foreach ($prizeList as $prize) {
            for($i=0;$i<$prize->inventory;$i++) {
                $prizePool[] = $prize->id;
            }
        }
        return $prizePool[array_rand($prizePool)];
    }

    /**
     * @param $prizeList
     * @return int
     */
    public function rateLottery($prizeList)
    {
        $prizeRand = mt_rand(1,10000);
        $prizePool = [];
        $prizeMaxId = 0;
        $consolationPrize = 0;
        foreach ($prizeList as $prize) {
            // 五等奖概率设置成概率的最大值，随机取值的时候过滤掉。如果不中奖，则返回五等奖
            if($prize->rate<10000) {
                if($prizeMaxId === 0) {
                    $prizeMinId = 1;
                    $prizeMaxId = $prize->rate;
                } else {
                    $prizeMinId = $prizeMaxId+1;
                    $prizeMaxId = $prizeMinId+$prize->rate-1;
                }
                for($i=$prizeMinId;$i<=$prizeMaxId;$i++) {
                    $prizePool[$i][] = $prize->id;
                }
            } else {
                $consolationPrize = intval($prize->id);
            }
        }
        if(isset($prizePool[$prizeRand])) {
            $prizeId = intval($prizePool[$prizeRand]);
        } else {
            $prizeId = $consolationPrize;
        }
        return $prizeId;
    }
}