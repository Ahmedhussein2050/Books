<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    protected function login()
    {
        return view('auth.login');
    }

    protected function doLogin(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if ($user == null) {
            return back()->with(['error' => 'Email is not found']);
        }
        $cred = array(
            'email' => $request->email,
            'password' => $request->password
        );
        if (Auth::attempt($cred)) {
            return redirect()->to('/');
        } else {
            return back()->with('error', 'Invalid Login Data!');
        }
    }

    protected function register()
    {
        return view('auth.register');
    }
    protected function doRegister(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|max:100|',
            'email' => 'required|unique:App\Models\User,email|email|max:100|',
            'password' => 'required|max:255|confirmed'
        ]);
        $user = new User;
        $user->name = $validated['name'];
        $user->email = $validated['email'];
        $user->guard = 'web';
        $user->password = Hash::make($validated['password']);
        $user->save();

        auth()->attempt([
            'email' => $validated['email'],
            'password' => $validated['password']
        ]);
        return redirect()->to('/');

    }
    protected function logout(){
        auth()->logout();
        return redirect('/');
    }
}
