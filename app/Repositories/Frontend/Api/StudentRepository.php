<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\School;
use App\Models\Api\Student;
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
 * Class StudentRepository.
 */
class StudentRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return Student::class;
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
            $student = parent::create([
                'user_id'        => $data['user_id'],
                'school_id'         => $data['school_id'],
                'classroom' => $data['classroom']
            ]);

            return $student;
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
        $student = $this->getById($id);
        $student->user_id = $input['user_id'];
        $student->school_id = $input['school_id'];
        $student->classroom = $input['classroom'];

        return $student->save();
    }
}
