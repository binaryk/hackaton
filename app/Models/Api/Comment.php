<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = "comments";
    protected $fillable = ['user_id', 'question_id', 'content', 'likes', 'dislikes', 'isAnswer'];
}
