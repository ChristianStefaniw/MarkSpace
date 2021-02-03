import 'package:dio/dio.dart';

import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class CreateAnnouncementService {
  static Future<void> run({
    String content,
    String teacherId,
    String classId,
  }) async {
    FormData _data = FormData.fromMap({
      'content': content,
      'teacher': teacherId,
      'class_announcement': classId,
      'date_time': DateTime.now()
    });
    await HTTPRequests().post(ANNOUNCEMENT_URL, data: _data);
  }
}
