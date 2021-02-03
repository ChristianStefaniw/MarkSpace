import 'package:mark_space_app/modules/models/marks/sub_grades.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';

class MarkData{
  final List<SubGrade> subGrades;
  final grade;
  final String comment;
  final StudentProfileData student;

  MarkData({this.subGrades, this.grade, this.student, this.comment});

  factory MarkData.fromJson(Map<String, dynamic> json){
    return MarkData(
      subGrades: json['subs'].map<SubGrade>((sub) => SubGrade.fromJson(sub)).toList(),
      grade: json['grade'],
      comment: json['comment'],
      student: StudentProfileData.fromJson(json['student']),
    );
  }

}