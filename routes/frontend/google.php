<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::post('google', 'GoogleController@index');
});
