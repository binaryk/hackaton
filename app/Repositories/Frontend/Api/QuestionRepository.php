<?php

namespace App\Repositories\Frontend\Api;

use App\Models\Api\Discipline;
use App\Models\Api\Question;
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
 * Class QuestionRepository.
 */
class QuestionRepository extends BaseRepository
{
    /**
     * @return string
     */
    public function model()
    {
        return Question::class;
    }

    public function filter($sort, $usersIds, $disciplines, $userId) {
        $query = Question::query();

        if ($disciplines) {
            $query->whereIn('discipline_id', $disciplines);
        }

        if($usersIds) {
            $query->whereIn('user_id', $usersIds);
        }

        if ($sort) {
            $query->orderby($sort, 'desc');
        }
        $query->with('user');
        $query->with('comments');

        return $query->get();
    }
}
