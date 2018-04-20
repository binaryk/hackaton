<?php
/* Chat */
Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::get('chat', 'HomeController@chat');

    Route::get('messages', 'MessageController@fetch');
    Route::post('messages', 'MessageController@sentMessage');
});