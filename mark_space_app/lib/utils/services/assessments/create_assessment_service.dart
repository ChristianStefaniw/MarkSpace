import 'package:dio/dio.dart';

import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class CreateAssessmentService {
  static Future<void> run({
    String unitId,
    String name,
    String weight,
  }) async {
    Map<String, dynamic> _data = {
      'unit': unitId,
      'name': name,
      'weight': weight,
    };
    await HTTPRequests().post(ASSESSMENTS_URL, data: _data);
  }
}
