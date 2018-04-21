<?php
/* Chat */
Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::get('privateChat/{user}', 'ChatController@privateChat')->name('privateChat');

    Route::get('messages/{user}', 'MessageController@fetch');
    Route::post('messages/{user}', 'MessageController@sentMessage');
});