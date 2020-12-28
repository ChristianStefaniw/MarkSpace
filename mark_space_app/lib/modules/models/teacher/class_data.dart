import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class ClassData {
  final int id;
  final String code;
  final String name;
  final String period;
  final String icon;
  final List<StudentProfileData> students;

  ClassData(
      {this.period, this.code, this.name, this.id, this.icon, this.students});

  /*ClassData.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    code = json['code'],
    name = json['name'],
    period = json['period'],
    icon = json['icon'],
    students = _studentData;

   */



  Future<List<StudentProfileData>> get _studentData async {
    List<StudentProfileData> _studentData = [
      await StudentProfileData.data(
          name: "Christian Stefaniw",
          email: "christian.stefaniw@student.tdsb.on.ca",
          classID: this.id),
    ];
    return _studentData;
  }

  Future<List<String>> get assessments async {
    List<String> _assessments =
        await HTTPRequests().read(CLASS_QUERY_ID_URL + this.id.toString()).then(
      (value) {
        List<String> _assessmentsNames = [];
        value[0]['units'].forEach(
          (unit) {
            unit['assessments'].forEach(
              (assessment) {
                _assessmentsNames.add(assessment['name']);
              },
            );
          },
        );
        return _assessmentsNames;
      },
    );
    return _assessments;
  }

  Future<List<StudentProfileData>> get studentData async {
    return await _studentData;
  }
}
