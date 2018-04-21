<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
        Route::resource('questions', 'QuestionController');
        Route::get('questions/{id}/like', 'QuestionController@like');
        Route::get('questions/{id}/dislike', 'QuestionController@dislike');
        Route::get('questions/{id}/view', 'QuestionController@view');
        Route::get('question/{id}/show', 'QuestionController@show');

});
