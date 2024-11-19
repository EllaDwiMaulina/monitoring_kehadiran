import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceProvider.attendanceHistory.length,
        itemBuilder: (context, index) {
          final record = attendanceProvider.attendanceHistory[index];
          return ListTile(
            title: Text(record.date),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
            ),
          );
        },
      ),
    );
  }
}
