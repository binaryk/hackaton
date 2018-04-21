<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('messages', function (Blueprint $table){
            $table->dropColumn('user_id');

            $table->integer('sent_by');
            $table->integer('sent_to');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('messages', function (Blueprint $table){
            $table->dropColumn('sent_by');
            $table->dropColumn('sent_to');

            $table->integer('user_id');
        });
    }
}
