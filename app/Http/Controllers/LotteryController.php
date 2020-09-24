<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\LotteryService;
use Illuminate\Http\Response;

class LotteryController extends Controller
{
    public function getPrize(Request $request, LotteryService $lotteryService, Response $response)
    {
        $userId = $request->get('user_id');
         return $lotteryService->getLottery($userId);
    }
    public function getRatePrize(Request $request, LotteryService $lotteryService)
    {
        $userId = $request->get('user_id');
        return $lotteryService->getLottery($userId, 2);
    }
}
