import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/modules/models/classes/announcement.dart';
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

    List<StudentProfileData> _students = await compute(_deserializeStudents, _class['students'] as List<dynamic>);
    List<UnitData> _units = await compute(_deserializeUnits, _class['units'] as List<dynamic>);
    List<AnnouncementData> _announcements = await compute(deserializeAnnouncements, _class['announcements'] as List<dynamic>);

    /*
    List<StudentProfileData> _students = _deserializeStudents(_class['students']);
    List<UnitData> _units = _deserializeUnits(_class['units']);
    List<AnnouncementData> _announcements = deserializeAnnouncements(_class['announcements']);
     */



    _class.addAll({'students': _students});
    _class.addAll({'units': _units});
    _class.addAll({'announcements': _announcements});

    return ClassData.fromJson(_class);
  }

  static Future<List<PreviewClass>> previewClasses(String email) async {
    List<dynamic> _classes = await HTTPRequests()
        .get(EMAIL_QUERY_TEACHER_URL + email, condition: 'to_django')
        .then((value) => value[0]['class_teacher']);

    if (_classes.isEmpty){
      return [];
    }
    return compute(_deserializePreviewClasses, _classes);

  }

  static List<PreviewClass> _deserializePreviewClasses(List<dynamic> data){
    return data.map<PreviewClass>((_class) => PreviewClass.fromJson(_class)).toList();
  }

  static List<StudentProfileData> _deserializeStudents(List<dynamic> students) {
    return students
        .map<StudentProfileData>(
            (student) => StudentProfileData.fromJson(student))
        .toList();
  }

  static List<UnitData> _deserializeUnits(List<dynamic> units) {
    return units.map<UnitData>((unit) => UnitData.fromJson(unit)).toList();
  }

  static List<AnnouncementData> deserializeAnnouncements(List<dynamic> response){
    return response.map<AnnouncementData>((announcement){
      final f = new DateFormat('yyyy-MM-dd hh:mm a');
      announcement['date_time'] = f.format(DateTime.parse(announcement['date_time']));
      return AnnouncementData.fromJson(announcement);
    }).toList();
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
