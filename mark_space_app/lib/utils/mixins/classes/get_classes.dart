import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class GetClasses {
  final String email;

  GetClasses(this.email);

  Future<List> classes() async {
    List _classIDS = await HTTPRequests()
        .read('teacher/?email=${this.email}')
        .then((value) => value[0]['teacher_classes']);

    List _classes = [];

    for (final element in _classIDS) {
      _classes.add(
        await HTTPRequests().read('class/?id=$element').then(
              (value) => value[0],
            ),
      );
    }

    List<ClassData> _classData = [];
    _classes.forEach((e) {
      _classData.add(_createClassData(e));
    });

    return _classData;
  }

  static ClassData _createClassData(Map value) {
    return ClassData(
      id: value['id'],
      code: value['code'],
      name: value['name'],
      period: value['period'],
      icon: value['icon'],
    );
  }
}
