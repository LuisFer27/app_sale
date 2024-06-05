<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Usuario extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
    'id',
    'name',
    'lastName',
    'email',
    'phone',
    'password'
    ];
    protected $rules=[
    'name'=>'string|max:100',
    'lastName'=>'string|max:100',
    'email'=>'string|max:250',
    'phone'=>'string|max:20',
    'password'=>'string|max:20'
    ];
}
