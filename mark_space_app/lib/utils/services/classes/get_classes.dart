import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class GetClasses {
  final String email;

  GetClasses(this.email);

  Future<List> classes() async {
    List _classIDS = await HTTPRequests()
        .get(EMAIL_QUERY_TEACHER_URL + this.email)
        .then((value) => value[0]['teacher_classes']);

    List _classes = [];

    for (final element in _classIDS) {
      _classes.add(
        await HTTPRequests().get(CLASS_QUERY_ID_URL + element.toString()).then(
              (value) => value[0],
            ),
      );
    }

    List<ClassData> _classData = [];
    _classes.forEach((e) {
      _classData.add(_createClassDataFromJson(e));
    });

    return _classData;
  }

  static ClassData _createClassDataFromJson(Map<String, dynamic> json) {
    return ClassData(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      period: json['period'],
      icon: json['icon'],
    );
  }
}
