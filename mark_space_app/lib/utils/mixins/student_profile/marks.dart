import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class Marks{
  static Future<List> marks(String email) async {
    return await HTTPRequests()
        .read(EMAIL_QUERY_STUDENT_URL + email)
        .then((value) => value[0]['units']);

  }

  static double average(List marks) {
    List _grades = [];
    marks.forEach((unit) {
      unit['assessments'].forEach((assessment) {
        _grades.add(assessment['marks']['grade']);
      });
    });
    double _average = _grades.reduce((a, b) => a + b);
    return _average;
  }
}