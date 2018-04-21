<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::resource('comments', 'CommentController');
    Route::post('comments/for-question', 'CommentController@questionComments');
    Route::get('comments/{id}/dislike', 'CommentController@dislike');
    Route::get('comments/{id}/like', 'CommentController@like');
});