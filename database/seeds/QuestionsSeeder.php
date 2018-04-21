<?php

use App\Models\Auth\User;
use App\Models\Api\Question;
use Illuminate\Database\Seeder;

/**
 * Class UserTableSeeder.
 */

class QuestionsTableSeeder extends Seeder
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
        Question::truncate();
        $faker = Faker\Factory::create();
        $questions = [
        ];

        for($i = 0; $i < 100; $i++ ) {
            $questions[] = [
                    'user_id' => $faker->numberBetween(1, 3),
                    'content' => $faker->text,
                    'likes' => $faker->numberBetween(0, 100),
                    'dislikes' => $faker->numberBetween(0, 100),
                    'views' => $faker->numberBetween(0, 1000),
                    'answered' => $faker->numberBetween(0, 1),
                    'created_at' => $faker->dateTime(),
                    'updated_at' => $faker->dateTime()
                ];
        }

        Question::insert($questions);


        $this->enableForeignKeys();
    }
}
