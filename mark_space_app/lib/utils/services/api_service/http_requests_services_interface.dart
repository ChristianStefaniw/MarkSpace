import 'package:dio/dio.dart';

abstract class HttpRequestsInterface{
  Dio dio;

  Future read(String extension);

  Future create(String extension);

  Future update(String extension);

  Future delete(String extension);
}