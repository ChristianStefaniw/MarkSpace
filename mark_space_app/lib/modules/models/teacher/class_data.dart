import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';

class ClassData {
  final String id;
  final String code;
  final String name;
  final String period;
  final String icon;
  final List<StudentProfileData> students;

  ClassData(
      {this.period, this.code, this.name, this.id, this.icon, this.students});

  factory ClassData.fromJson(Map<String, dynamic> json) {
    return ClassData(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      period: json['period'],
      icon: json['icon'],
    );
  }
}
