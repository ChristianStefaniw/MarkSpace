import 'package:dio/dio.dart';

import 'package:mark_space_app/constants/app_constants.dart';
import '../api_service/http_requests_service.dart';

class CreateClassService {
  static Future<void> run({
    String teacherId,
    String name,
    String period,
    String code,
  }) async {
    FormData _data = FormData.fromMap(
      {
        'name': name,
        'period': period,
        'code': code,
        'icon': 'https://image.flaticon.com/icons/png/512/201/201555.png',
        'teachers': teacherId
      },
    );

    await HTTPRequests().post(CLASS_URL, data: _data);
  }
}
