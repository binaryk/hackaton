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
        $disciplines = [
            ['name' => 'Matematica'],
            ['name' => 'Romana'],
            ['name' => 'Chimie'],
            ['name' => 'Fizica'],
            ['name' => 'Sport'],
            ['name' => 'Istorie'],
            ['name' => 'Geografie']
        ];

        foreach($disciplines as $discipline){
            DB::table('disciplines')->insert($discipline);
        }
    }
}
