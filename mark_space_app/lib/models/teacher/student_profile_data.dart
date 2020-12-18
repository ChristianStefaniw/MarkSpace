import 'package:mark_space_app/net/teacher/http_requests.dart';

class StudentProfileData {
  final String email;
  final String name;
  final String classID;

  StudentProfileData({this.name, this.email, this.classID});

  Future<Map> get _marks async {
    return await HTTPRequests()
        .read('student/?email=${this.email}')
        .then((value) => value[0]);
  }

  double _average(Map marks) {
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

  Future<Map> get data async {
    Map _marksValue = await _marks.then((value) => value['marks']);
    return {
      'name': this.name,
      'email': this.email,
      'marks': _marksValue,
      'average': _average(_marksValue),
    };
  }
}
