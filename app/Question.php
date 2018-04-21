<?php

namespace App;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';
    protected $fillable = ['user_id', 'content', 'likes', 'dislikes', 'views', 'answered', 'discipline_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
