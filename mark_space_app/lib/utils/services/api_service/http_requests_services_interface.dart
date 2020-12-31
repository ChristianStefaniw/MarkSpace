import 'package:dio/dio.dart';

abstract class HttpRequestsInterface{
  Dio dio;

  Future get(String extension);

  Future post(String extension);

  Future patch(String extension);

  Future delete(String extension);
}