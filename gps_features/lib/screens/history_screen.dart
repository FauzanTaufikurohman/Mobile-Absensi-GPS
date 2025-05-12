import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> attendanceHistory = [
      {'date': '2023-10-01', 'status': 'Present'},
      {'date': '2023-10-02', 'status': 'Absent'},
      {'date': '2023-10-03', 'status': 'Present'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: attendanceHistory.length,
          itemBuilder: (context, index) {
            final history = attendanceHistory[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Icon(
                    history['status'] == 'Present'
                        ? Icons.check_circle
                        : Icons.cancel,
                    color:
                        history['status'] == 'Present'
                            ? Color(
                              0xFF3678C9,
                            ) // Use a solid color instead of a gradient
                            : Colors.red,
                    size: 36,
                  ),
                  title: Text(
                    'Date: ${history['date']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Status: ${history['status']}',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          history['status'] == 'Present'
                              ? Color(0xFF3678C9)
                              : Colors.red,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
