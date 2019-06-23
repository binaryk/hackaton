<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
        Route::resource('questions', 'QuestionController');
        Route::get('question/{id}/like', 'QuestionController@like');
        Route::get('question/{id}/dislike', 'QuestionController@dislike');
        Route::get('question/{id}/view', 'QuestionController@view');
        Route::get('question/{id}/show', 'QuestionController@show');
        Route::post('questions/filter', 'QuestionController@filter');
});
