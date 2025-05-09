<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::redirect('/', 'login');

Route::get('dashboard', function () {
    return Inertia::render('Dashboard', [
        'user' => [
            'email' => auth()->user()->email,
            'password' => auth()->user()->password, // только если нужно временно показать
        ]
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
