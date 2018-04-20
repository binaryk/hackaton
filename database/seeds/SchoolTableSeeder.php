<?php

use Illuminate\Database\Seeder;

class SchoolTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $schools = [
            ['name' => 'Mihai Eminescu', 'city' => 'Cluj-Napoca'],
            ['name' => 'Tiberiu Popoviciu', 'city' => 'Bucuresti'],
            ['name' => 'Stefan cel Mare', 'city' => 'Cluj-Napoca']
        ];

        foreach($schools as $school){
            DB::table('schools')->insert($school);
        }
    }
}
