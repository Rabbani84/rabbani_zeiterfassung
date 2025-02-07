import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../models/employee.dart';

class AttendanceViewModel extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Employee> employees = [];

  Future<void> loadEmployees() async {
    employees = await _dbHelper.getEmployees();
    notifyListeners();
  }

  Future<void> addEmployee(String name, String jobNumber) async {
    await _dbHelper.insertEmployee(Employee(name: name, jobNumber: jobNumber));
    await loadEmployees();
  }
}
