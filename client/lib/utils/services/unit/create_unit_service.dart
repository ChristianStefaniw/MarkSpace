import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class CreateUnitService {
  static Future<void> run({String name, String classId}) async {
    Map<String, dynamic> _data = {'name': name, 'class_unit': classId};
    await HTTPRequests().post(UNITS_URL, data: _data);
  }
}
