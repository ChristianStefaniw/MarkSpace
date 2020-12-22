import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class Marks{
  static Future<Map> marks(String email) async {
    return await HTTPRequests()
        .read('student/?email=$email')
        .then((value) => value[0]);
  }

  static double average(Map marks) {
    List _grades = [];
    marks.forEach(
          (unit, value) {
        value.forEach(
              (element) {
            double _singleGrade =
            double.parse(element['grade'].replaceAll('%', ''));
            _grades.add(_singleGrade / 100 * element['weight'].toDouble());
          },
        );
      },
    );
    double _average = _grades.reduce((a, b) => a + b);
    return _average;
  }
}