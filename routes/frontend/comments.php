<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::resource('comments', 'CommentController');
    Route::post('comments/for-question', 'CommentController@questionComments');
});