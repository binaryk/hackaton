<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\Discipline;
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
 * Class DisciplineRepository.
 */
class DisciplineRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return Discipline::class;
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
            $discipline = parent::create([
                'name'        => $data['name'],
            ]);

            return $discipline;
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
        $discipline = $this->getById($id);
        $discipline->name = $input['name'];

        return $discipline->save();
    }
}
