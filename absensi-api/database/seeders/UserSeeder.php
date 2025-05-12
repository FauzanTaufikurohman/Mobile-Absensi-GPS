<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Fauzan Taufikurohman',
            'email' => 'fauzan@gmail.com',
            'password' => Hash::make('password123'), // enkripsi password
            'email_verified_at' => now(),
        ]);
    }
}