<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::group(['namespace' => 'User'], function () {
        Route::get('users-list', 'UserController@listView')->name('frontend-users-list');
        Route::get('users-view/{id}', 'UserController@singleView')->name('frontend-users-view');
        Route::resource('users', 'UserController');
    });
});
