import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/marks/mark_data.dart';
import 'package:mark_space_app/modules/models/marks/unit_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';


class Deserialize {
  static Future<ClassData> selectClass(String classId) async {
    Map<String, dynamic> _class = await HTTPRequests()
        .get(CLASS_QUERY_ID_URL + classId)
        .then((value) => value[0]);


    List<StudentProfileData> _students = deserializeStudents(_class['students']);

    List<UnitData> _units = deserializeUnits(_class['units']);

    _class.addAll({'students': _students});
    _class.addAll({'units': _units});

    return ClassData.fromJson(_class);
  }

  static Future<List<PreviewClass>> previewClasses(String email) async {
    List<dynamic> _classes = await HTTPRequests()
        .get(EMAIL_QUERY_TEACHER_URL + email)
        .then((value) => value[0]['teacher_classes']);

    return _classes.map((_class) => PreviewClass.fromJson(_class)).toList();
  }

  static List<StudentProfileData> deserializeStudents(List<dynamic> students) {

    return students
        .map<StudentProfileData>(
            (student) => StudentProfileData.fromJson(student))
        .toList();
  }

  static List<UnitData> deserializeUnits(List<dynamic> units) {
    return units.map<UnitData>((unit) => UnitData.fromJson(unit)).toList();
  }

  static deserializeStudentAssessments(Map<String, dynamic> response, {ClassData classData, StudentProfileData student}){
    List<UnitData> _tempUnits = [];
    List<AssessmentData> _tempAssessments = [];
    response['student_classes'].forEach(
          (_class) {
        if (_class['id'] == classData.id) {
          _class['units'].forEach(
                (unit) {
              unit['assessments'].forEach(
                    (assessments) {
                  assessments['marks'].forEach(
                        (mark) {
                      if (mark['student']['name'] == student.name) {
                        _tempAssessments.add(AssessmentData(
                            name: assessments['name'],
                            weight: assessments['weight'],
                            marks: [MarkData.fromJson(mark)]));
                      }
                    },
                  );
                  _tempAssessments.isNotEmpty
                      ? _tempUnits.add(
                    UnitData(
                      assessments: List<AssessmentData>.from(
                          _tempAssessments),
                      name: unit['name'],
                    ),
                  )
                      : null;
                  _tempAssessments.clear();
                },
              );
            },
          );
        }
      },
    );
    return _tempUnits;
  }
}
