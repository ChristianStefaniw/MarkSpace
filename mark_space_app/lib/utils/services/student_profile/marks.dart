import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class Marks {
  static Future<List> marks(String classId) async {
    return await HTTPRequests().get(CLASS_QUERY_ID_URL + classId).then(
      (value) {
        return value[0]['units'];
      },
    );
  }

  static double average(List units, String studentId) {
    List _grades = [];
    units.forEach(
      (unit) {
        unit['assessments'].forEach(
          (assessment) {
            assessment['marks'].forEach(
              (mark) {
                if (mark['student'] == studentId) {
                  _grades.add(mark['grade']);
                }
              },
            );
          },
        );
      },
    );

    double _average = _grades.reduce((a, b) => a + b);
    return _average;
  }
}
