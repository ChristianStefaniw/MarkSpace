import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class AddStudentService {
  static Future<void> run({String name, String email, String classId}) async {
    Map<String, dynamic> _data = {
      'name': name,
      'email': email,
      'class_student': classId
    };

    await HTTPRequests().post(STUDENT_URL, data: _data);
  }
}
