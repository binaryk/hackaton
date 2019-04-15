<?php

use App\Models\Auth\User;
use Illuminate\Database\Seeder;

use App\Models\Api\Student;
/**
 * Class UserTableSeeder.
 */
class StudentTableSeeder extends Seeder
{
    use DisableForeignKeys;

    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        $this->disableForeignKeys();
        Student::truncate();

        for($i = 6; $i <= 28 + 6; $i++) {
            Student::create([
                'user_id' => $i,
                'school_id' => '1',
                'classroom' => 'IX A',
            ]);
        }

        for($i = 35; $i <= 61; $i++) {
            Student::create([
                'user_id' => $i,
                'school_id' => '1',
                'classroom' => 'IX B',
            ]);
        }

        for($i = 62; $i <= 82; $i++) {
            Student::create([
                'user_id' => $i,
                'school_id' => '1',
                'classroom' => 'X A',
            ]);
        }

        $this->enableForeignKeys();
    }
}
