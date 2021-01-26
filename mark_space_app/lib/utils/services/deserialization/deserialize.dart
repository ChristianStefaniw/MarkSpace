import 'package:flutter/foundation.dart';
import 'dart:async';

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


    List<StudentProfileData> _deserializeStudents(List<dynamic> students) {
      return students
          .map<StudentProfileData>(
              (student) => StudentProfileData.fromJson(student))
          .toList();
    }

    List<UnitData> _deserializeUnits(List<dynamic> units) {
      return units.map<UnitData>((unit) => UnitData.fromJson(unit)).toList();
    }


    // Isolates the large task of deserializing all of the students and units
    List<StudentProfileData> _students = await compute(_deserializeStudents, _class['students'] as List<dynamic>);
    List<UnitData> _units = await compute(_deserializeUnits, _class['units'] as List<dynamic>);

    //List<StudentProfileData> _students = _deserializeStudents(_class['students'] as List<dynamic>);
    //List<UnitData> _units = _deserializeUnits(_class['units'] as List<dynamic>);

    _class.addAll({'students': _students});
    _class.addAll({'units': _units});

    return ClassData.fromJson(_class);
  }

  static Future<List<PreviewClass>> previewClasses(String email) async {
    List<dynamic> _classes = await HTTPRequests()
        .get(EMAIL_QUERY_TEACHER_URL + email)
        .then((value) => value[0]['class_teacher']);

    if (_classes.isEmpty){
      return [];
    }

    List<PreviewClass> _deserializePreviewClasses(List<dynamic> data){
      return data.map<PreviewClass>((_class) => PreviewClass.fromJson(_class)).toList();
    }


    return compute(_deserializePreviewClasses, _classes);

  }


  static deserializeStudentAssessments(Map<String, dynamic> response,
      {ClassData classData}) {
    List<UnitData> _tempUnits = [];
    List<AssessmentData> _tempAssessments = [];
          response['class_student'][0]['units'].forEach(
            (unit) {
              unit['assessments'].forEach(
                (assessments) {
                  assessments['marks'].forEach(
                    (mark) {
                      _tempAssessments.add(AssessmentData(
                          name: assessments['name'],
                          weight: assessments['weight'],
                          marks: [MarkData.fromJson(mark)]));

                    },
                  );
                  _tempAssessments.isNotEmpty
                      ? _tempUnits.add(
                          UnitData(
                            assessments:
                                List<AssessmentData>.from(_tempAssessments),
                            name: unit['name'],
                          ),
                        )
                      : null;
                  _tempAssessments.clear();
                },
              );
            },
    );
    return _tempUnits;
  }
}
