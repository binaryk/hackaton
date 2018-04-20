<?php

use Illuminate\Database\Seeder;
use App\Models\Api\School;

class SchoolTableSeeder extends Seeder
{
    use DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->disableForeignKeys();
        School::truncate();
        $schools = [
            ['name' => 'Mihai Eminescu', 'city' => 'Cluj-Napoca'],
            ['name' => 'Tiberiu Popoviciu', 'city' => 'Bucuresti'],
            ['name' => 'Stefan cel Mare', 'city' => 'Cluj-Napoca']
        ];

        foreach($schools as $school){
            DB::table('schools')->insert($school);
        }

        $this->enableForeignKeys();
    }
}
