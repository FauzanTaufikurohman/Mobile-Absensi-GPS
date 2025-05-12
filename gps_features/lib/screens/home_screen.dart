import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

Future<void> absenMasuk(double latitude, double longitude) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  if (token == null) {
    print('Token tidak ditemukan. Harap login ulang.');
    return;
  }

  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/absen'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'status': 'masuk',
      'latitude': latitude,
      'longitude': longitude,
    }),
  );

  if (response.statusCode == 200) {
    print('Absen masuk berhasil');
  } else {
    print('Gagal absen: ${response.body}');
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleAbsenMasuk() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Layanan lokasi tidak aktif.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Izin lokasi ditolak.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Izin lokasi ditolak secara permanen.');
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await absenMasuk(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.27, -1),
                  end: Alignment(1, 0.7),
                  colors: [Color(0xFF3678C9), Color(0xFF1B3B63)],
                  stops: [0.1582, 0.7914],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFD9D9D9),
                    radius: 24,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/logo.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Selamat Datang, Fauzan!!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.blue.shade400,
                              width: 1.5,
                            ),
                          ),
                        ),
                        value: 'Shift 1',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                        items: const [
                          DropdownMenuItem(
                            value: 'Shift 1',
                            child: Text('07:00 - 16:00'),
                          ),
                          DropdownMenuItem(
                            value: 'Shift 2',
                            child: Text('16:00 - 00:00'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tanggal : 13/04/2025"),
                  const Text("Lokasi anda : -7.94624, 112.6137856"),
                  const SizedBox(height: 16),

                  // Absen Masuk pakai GPS
                  AbsenCard(
                    title: 'Absen Masuk',
                    subtitle: 'Belum Absen',
                    icon: Icons.login,
                    backgroundColor: const Color(0xFF007B8A),
                    onTap: _handleAbsenMasuk,
                  ),

                  const SizedBox(height: 8),
                  const AbsenCard(
                    title: 'Absen Keluar',
                    subtitle: 'Belum Absen',
                    icon: Icons.logout,
                    backgroundColor: Color(0xFF813C0E),
                  ),
                  const SizedBox(height: 8),
                  const AbsenCard(
                    title: 'Koordinat Absen',
                    subtitle: 'Belum Absen',
                    icon: Icons.location_on,
                    backgroundColor: Color(0xFF007B8A),
                  ),
                  const SizedBox(height: 16),

                  // Tombol bawah
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB2CF63),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Ajukan Ijin"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E88E5),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.history, size: 20),
                                SizedBox(width: 6),
                                Text(
                                  "Riwayat Absensi",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AbsenCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const AbsenCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: Icon(icon, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}
