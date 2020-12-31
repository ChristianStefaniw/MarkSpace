import 'package:mark_space_app/utils/services/student_profile/marks.dart';

class StudentProfileData {
  final String email;
  final String name;
  final List marks;
  final double average;
  final String studentId;

  StudentProfileData(
      {this.name, this.email, this.marks, this.average, this.studentId});

  factory StudentProfileData.fromJson(Map<String, dynamic> json){
    return StudentProfileData(
      email: json['email'],
      name: json['name'],
      studentId: json['id'],
    );
  }
}
