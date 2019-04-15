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
//        $this->disableForeignKeys();
//        Question::truncate();
//        $faker = Faker\Factory::create();
//        $a = [
//            'Ma poate ajuta cineva sa reolv urmatoarea problema de chimie?\n
//            O solutie de acid sulfuric are 70% oxigen. Care este concentratia solutiei?\n
//            Multumesc anticipat.\n',
//
//            'Să se găsească funcțiile f(x) și g(x) știind că verifică sistemul ecuații:
//            |f(x)+3g(x)|=3-x
//            |3g(x)-f(x)|=x-3.'
//        ];
//        $questions = [
//        ];
//
//        for($i = 0; $i < 100; $i++ ) {
//            $questions[] = [
//                    'user_id' => $faker->numberBetween(6, 81),
//                    'content' => $faker->text,
//                    'likes' => $faker->numberBetween(0, 100),
//                    'dislikes' => $faker->numberBetween(0, 100),
//                    'views' => $faker->numberBetween(0, 1000),
//                    'answered' => $faker->numberBetween(0, 1),
//                    'created_at' => $faker->dateTime(),
//                    'updated_at' => $faker->dateTime()
//                ];
//        }
//
//        Question::insert($questions);


//        $this->enableForeignKeys();
    }
}
