<?php
namespace App\Bll;
class Utility
{
    public static function check_in_cart($user, $book_id): string
    {
        if ($user && $user->cart){
            $cart = $user->cart->pluck('book_id')->toArray();
            if (in_array($book_id, $cart)){
                return 'disabled';
            }else{
                return '';
            }
        }else{
            return '';
        }
    }
}
