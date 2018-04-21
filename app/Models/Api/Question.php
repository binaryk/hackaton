<?php

namespace App\Models\Api;

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
    public function category(){
        return $this->belongsTo(Discipline::class, 'discipline_id', 'id');
    }
}
