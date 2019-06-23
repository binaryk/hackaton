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
            'user_id' => '5',
            'school_id' => '1'
        ]);

        $this->enableForeignKeys();
    }
}
