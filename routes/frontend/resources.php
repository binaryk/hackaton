<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::get('resources', 'ResourcesController@index');
});
