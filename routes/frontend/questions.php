<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
        Route::resource('questions', 'QuestionController');
        Route::get('question/{id}/show', 'QuestionController@show');
});
