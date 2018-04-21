<?php

namespace App\Models\Api;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = "comments";
    protected $fillable = ['user_id', 'question_id', 'content', 'likes', 'dislikes', 'isAnswer'];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
