import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/attendance.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<Attendance> _attendanceHistory = [];

  List<Student> get students => _students;
  List<Attendance> get attendanceHistory => _attendanceHistory;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final presentCount = _students.where((student) => student.isPresent).length;
    final absentCount = _students.length - presentCount;

    final currentDate = DateTime.now();
    _attendanceHistory.insert(
      0,
      Attendance(
        date: "${currentDate.day}/${currentDate.month}/${currentDate.year}",
        presentCount: presentCount,
        absentCount: absentCount,
      ),
    );

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
