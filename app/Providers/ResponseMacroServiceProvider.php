<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Response;

class ResponseMacroServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        Response::macro('horesp', function ($code=2000, $data=null, $msg=null) {
            $content =  array(
                'code'    =>  $code,
                'data'    =>  $data,
                'msg'     =>  $msg
            );
            return response()->json($content);
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
