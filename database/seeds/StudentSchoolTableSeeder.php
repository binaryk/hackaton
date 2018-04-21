<?php

use Illuminate\Database\Seeder;
use App\Models\Api\School;

class StudentSchoolTableSeeder extends Seeder
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
        DB::table('student_disciplines')->truncate();
        DB::table('teacher_disciplines')->truncate();

        $studentDisciplines = [
            [ 'student_id' => '1', 'discipline_id' => 1, ],
            [ 'student_id' => '1', 'discipline_id' => 2, ],
            [ 'student_id' => '1', 'discipline_id' => 3, ],
            [ 'student_id' => '2', 'discipline_id' => 1, ],
            [ 'student_id' => '2', 'discipline_id' => 3, ],
            [ 'student_id' => '2', 'discipline_id' => 4, ],
            [ 'student_id' => '3', 'discipline_id' => 5, ],
            [ 'student_id' => '3', 'discipline_id' => 2, ],
            [ 'student_id' => '3', 'discipline_id' => 7, ],
        ];

        foreach($studentDisciplines as $school){
            DB::table('student_disciplines')->insert($school);
        }

        $teachDisc = [
            [ 'teacher_id' => '1', 'discipline_id' => 1, ],
            [ 'teacher_id' => '1', 'discipline_id' => 2, ],
            [ 'teacher_id' => '2', 'discipline_id' => 3, ],
            [ 'teacher_id' => '2', 'discipline_id' => 4, ],
        ];

        foreach($teachDisc as $school){
            DB::table('teacher_disciplines')->insert($school);
        }

        $this->enableForeignKeys();
    }
}
