class Employee {
  int? id;
  String name;
  String jobNumber;

  Employee({this.id, required this.name, required this.jobNumber});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'job_number': jobNumber};
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      jobNumber: map['job_number'],
    );
  }
}
