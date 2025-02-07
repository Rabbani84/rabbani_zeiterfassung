import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/employee.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'employees.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        // Arbeitsnehmer-Tabelle erstellen
        await db.execute('''
          CREATE TABLE employees (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            job_number TEXT NOT NULL UNIQUE
          )
        ''');

        // Anwesenheits-Tabelle erstellen
        await db.execute('''
          CREATE TABLE attendance (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            employee_id INTEGER,
            date TEXT NOT NULL,
            check_in TEXT,
            check_out TEXT,
            break_duration INTEGER DEFAULT 0,
            FOREIGN KEY(employee_id) REFERENCES employees(id)
          )
        ''');
      },
    );
  }

  Future<int> insertEmployee(Employee employee) async {
    final db = await database;
    return await db.insert('employees', employee.toMap());
  }

  Future<List<Employee>> getEmployees() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('employees');
    return result.map((map) => Employee.fromMap(map)).toList();
  }
}
