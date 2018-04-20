<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::group(['namespace' => 'User'], function () {
        Route::resource('users', 'UserController');
    });
});
