import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/constants/app_constants.dart';
import 'api_service/http_requests_service.dart';

class CreateClassService {
  static Future<void> run(
    {
    int id,
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
        'teachers': id
      },
    );

    await HTTPRequests().create(CLASS_URL, data: _data);
  }
}
