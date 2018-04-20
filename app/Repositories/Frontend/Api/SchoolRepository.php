<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\School;
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
 * Class SchoolRepository.
 */
class SchoolRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return School::class;
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
            $school = parent::create([
                'name'        => $data['name'],
                'city'        => $data['city'],
            ]);

            return $school;
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
        $school = $this->getById($id);
        $school->name = $input['name'];
        $school->city = $input['city'];

        return $school->save();
    }
}
