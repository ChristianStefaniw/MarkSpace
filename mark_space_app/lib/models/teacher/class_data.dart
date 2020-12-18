import 'package:mark_space_app/models/teacher/student_profile_data.dart';

class ClassData {
  final String id;
  final String code;
  final String name;
  final String period;
  final String icon;

  ClassData({this.period, this.code, this.name, this.id, this.icon});

  List<StudentProfileData> _studentData(){
    List<StudentProfileData> _studentData = [
      StudentProfileData(
          name: "Christian Stefaniw",
          email: "christian.stefaniw@student.tdsb.on.ca",
          classID: this.id)
    ];
    return _studentData;
  }

  List<String> _units = ['Exponential Functions Unit Test', 'Trigonometric Functions Unit Test', 'Final Exam'];

  List<StudentProfileData> get studentData {
    return _studentData();
  }

  List get units => this._units;
}
