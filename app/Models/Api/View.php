<?php

namespace App\Models\Api;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

class View extends Model
{
    protected $table = 'likes';
    protected $fillable = ['user_id', 'question_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function question()
    {
        return $this->belongsTo(Question::class);
    }

}
