import 'package:mark_space_app/modules/models/marks/unit_data.dart';

class StudentProfileData {
  final String email;
  final String name;
  List<UnitData> marks = [];
  final double average;
  final String studentId;

  StudentProfileData(
      {this.name, this.email, this.average, this.studentId});

  factory StudentProfileData.fromJson(Map<String, dynamic> json){
    return StudentProfileData(
      email: json['email'],
      name: json['name'],
      studentId: json['id'],
    );
  }
}
