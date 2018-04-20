<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\Teacher;
use App\Models\Api\TeacherDisciplines;
use Illuminate\Support\Facades\DB;
use App\Repositories\BaseRepository;

/**
 * Class TeacherDisciplinesRepository.
 */
class TeacherDisciplinesRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return TeacherDisciplines::class;
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
                'teacher_id'        => $data['teacher_id'],
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
        $teacherDiscipline->teacher_id = $input['teacher_id'];
        $teacherDiscipline->discipline_id = $input['discipline_id'];

        return $teacherDiscipline->save();
    }
}
