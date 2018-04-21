<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\Discipline;
use App\Models\Api\School;
use App\Models\Api\StudentDisciplines;
use Carbon\Carbon;
use App\Models\Auth\User;
use Illuminate\Http\UploadedFile;
use App\Models\Auth\SocialAccount;
use Illuminate\Support\Facades\DB;
use App\Exceptions\GeneralException;
use App\Repositories\BaseRepository;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Events\Frontend\Auth\UserConfirmed;
use App\Events\Frontend\Auth\UserProviderRegistered;
use App\Notifications\Frontend\Auth\UserNeedsConfirmation;

/**
 * Class StudentDisciplinesRepository.
 */
class StudentDisciplinesRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return StudentDisciplines::class;
    }


    /**
     * @param array $data
     *
     * @return \Illuminate\Database\Eloquent\Model|mixed
     * @throws \Exception
     * @throws \Throwable
     */
    public function create(array $data)
    {
        return DB::transaction(function () use ($data) {
            $teacherDisciplines = parent::create([
                'student_id'        => $data['student_id'],
                'discipline_id'         => $data['discipline_id']
            ]);

            return $teacherDisciplines;
        });
    }

    /**
     * @param $id
     * @param array $input
     * @return array|bool
     * @internal param bool|UploadedFile $image
     *
     */
    public function update($id, array $input)
    {
        $teacherDiscipline = $this->getById($id);
        $teacherDiscipline->student_id = $input['student_id'];
        $teacherDiscipline->discipline_id = $input['discipline_id'];

        return $teacherDiscipline->save();
    }

    public function get(array $columns = ['*'])
    {
        return DB::table('student_disciplines')
            ->leftJoin('students','student_disciplines.student_id','=','students.id')
            ->leftJoin('disciplines','student_disciplines.discipline_id','=','disciplines.id')
            ->select('student_disciplines.*', 'disciplines.name as discipline_name', 'students.*')
            ->get();
    }
}
