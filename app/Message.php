<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $fillable = ['message', 'sent_by', 'sent_to'];

    public function sentByUser() {
        return $this->belongsTo('App\Models\Auth\User','sent_by');
    }

    public function sentToUser() {
        return $this->belongsTo('App\Models\Auth\User','sent_to');
    }
}
