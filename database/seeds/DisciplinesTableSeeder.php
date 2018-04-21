<?php

use Illuminate\Database\Seeder;

class DisciplinesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('disciplines')->truncate();

        $disciplines = [
            ['name' => 'Matematica'],
            ['name' => 'Romana'],
            ['name' => 'Chimie'],
            ['name' => 'Fizica'],
            ['name' => 'Sport'],
            ['name' => 'Istorie'],
            ['name' => 'Geografie']
        ];

        DB::table('disciplines')->insert($disciplines);
    }
}
