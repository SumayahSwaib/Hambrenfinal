<?php

namespace App\Http\Middleware;

use App\Models\Utils;
use Closure;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;

class EnsureTokenIsValid
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $user_id = ((int)($request->header('user_id')));
        if($user_id < 1){
            return Utils::success('Token not found.');             
        }
        $u = Administrator::find($user_id); 
        if ($u == null) {
            return Utils::success('User not found.'); 
        } 
        $request->user = $u;
        return $next($request);
    }
}
