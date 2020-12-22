import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class GetClasses{

  final String email;
  GetClasses(this.email);

  Future<List> classes() async {
    List _classIDs = await HTTPRequests()
        .read('teacher/?email=${this.email}')
        .then((value) => value[0]['teacher_classes']);

    List<ClassData> _classes = await this._getClassData(_classIDs);
    return _classes;
  }

  Future<List<ClassData>> _getClassData(List classIDs) async {
    List<ClassData> _classes = [];
    for (var element in classIDs) {
      _classes.add(
        await HTTPRequests().read('class/?id=$element').then((value) {
          return _createClassData(value[0]);
        }),
      );
    }
    return _classes;
  }

  static _createClassData(Map value) {
    return ClassData(
      id: value['id'],
      code: value['code'],
      name: value['name'],
      period: value['period'],
      icon: value['icon'],
    );
  }
}