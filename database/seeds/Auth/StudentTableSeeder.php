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

        // Add the master administrator, user id of 1
        Student::create([
            'user_id' => '3',
            'school_id' => '1',
            'classroom' => 'V',
        ]);
        Student::create([
            'user_id' => '4',
            'school_id' => '2',
            'classroom' => 'IV',
        ]);

        Student::create([
            'user_id' => '5',
            'school_id' => '1',
            'classroom' => 'V',
        ]);

        $this->enableForeignKeys();
    }
}
