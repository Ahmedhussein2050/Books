<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    //use Notifiable;
    use Notifiable;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $guard_name = 'admin';
    protected $table = 'users';
    protected $guard = "admin";
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Set connection for tracker package.
     */
    protected $connection = 'mysql';

    public function AauthAcessToken()
    {
        return $this->hasMany('\App\OauthAccessToken');
    }


    public function getImageAttribute($value)
    {
        if (\request()->is('api/*')) {
            return url($value);
        }
        return $value;
    }


}
