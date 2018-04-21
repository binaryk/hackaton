<?php

Route::group(['middleware' => ['auth', 'password_expires']], function () {
    Route::resource('disciplines', 'DisciplineController');
});