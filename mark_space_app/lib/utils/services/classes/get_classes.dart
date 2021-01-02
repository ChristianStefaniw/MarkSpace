import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/modules/models/teacher/preview_class.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class GetClasses {
  static Future<ClassData> selectClass(String classId) async {
    Map<String, dynamic> _class = await HTTPRequests()
        .get(CLASS_QUERY_ID_URL + classId)
        .then((value) => value[0]);

    return ClassData.fromJson(_class);
  }

  static Future<List<PreviewClass>> previewClasses(String email) async {
    List<dynamic> _classes = await HTTPRequests()
        .get(EMAIL_QUERY_TEACHER_URL + email)
        .then((value) => value[0]['teacher_classes']);

    return _classes.map((_class) =>PreviewClass.fromJson(_class)).toList();
  }
}
