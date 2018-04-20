<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\Teacher;
use Illuminate\Support\Facades\DB;
use App\Repositories\BaseRepository;

/**
 * Class TeacherRepository.
 */
class TeacherRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return Teacher::class;
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
            $teacher = parent::create([
                'user_id'        => $data['user_id'],
                'school_id'         => $data['school_id']
            ]);

            return $teacher;
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
        $teacher = $this->getById($id);
        $teacher->user_id = $input['user_id'];
        $teacher->school_id = $input['school_id'];

        return $teacher->save();
    }
}
