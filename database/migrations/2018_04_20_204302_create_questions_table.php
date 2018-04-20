<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questions', function (Blueprint $t) {
            $t->increments('id');
            $t->integer('user_id');
            $t->text('content');
            $t->integer('likes')->default(0);
            $t->integer('dislikes')->default(0);
            $t->integer('views')->default(0);
            $t->integer('answered')->default(0);
            $t->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questions');
    }
}
