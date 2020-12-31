import 'package:flutter/foundation.dart';

import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class DeserializeClasses{
  static Future fetchStudentData(String classId) async {
    final _response = await HTTPRequests()
        .get(CLASS_QUERY_ID_URL + classId)
        .then((value) => value[0]['students']);
    return compute(parseStudentData, _response);
  }

  static List<StudentProfileData> parseStudentData(response) {
    return response.map<StudentProfileData>((json) => StudentProfileData.fromJson(json)).toList() ;
  }
}