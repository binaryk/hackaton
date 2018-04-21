<?php

use App\Models\Auth\User;
use Illuminate\Database\Seeder;

use App\Models\Api\Teacher;
/**
 * Class UserTableSeeder.
 */
class TeacherTableSeeder extends Seeder
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
        Teacher::truncate();
        Teacher::create([
            'user_id' => '6',
            'school_id' => '1'
        ]);

        Teacher::create([
            'user_id' => '7',
            'school_id' => '3'
        ]);


        $this->enableForeignKeys();
    }
}
