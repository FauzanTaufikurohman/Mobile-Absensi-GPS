<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Absensi;
use Carbon\Carbon;

class AbsensiController extends Controller
{
    public function absen(Request $request)
    {
        // Validasi data
        $request->validate([
            'status' => 'required|in:masuk,keluar',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
        ]);

        // Ambil pengguna yang sedang login
        $user = $request->user();

        // Cek apakah absen sudah dilakukan
        $absen = Absensi::where('user_id', $user->id)
            ->whereDate('created_at', Carbon::today()) // Absen hari ini
            ->first();

        if ($absen) {
            return response()->json([
                'message' => 'Anda sudah melakukan absen hari ini.'
            ], 400);
        }

        // Simpan data absen
        $newAbsen = Absensi::create([
            'user_id' => $user->id,
            'status' => $request->status,  // 'masuk' atau 'keluar'
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'created_at' => Carbon::now(),
        ]);

        return response()->json([
            'message' => 'Absen berhasil.',
            'data' => $newAbsen,
        ]);
    }
}
