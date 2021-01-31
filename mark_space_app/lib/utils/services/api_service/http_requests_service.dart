import 'package:dio/dio.dart';

import 'http_requests_services_interface.dart';

class HTTPRequests implements HttpRequestsInterface{

  static final HTTPRequests _singleton = HTTPRequests._internal();
  factory HTTPRequests() => _singleton;
  HTTPRequests._internal();

  Dio dio = new Dio();

  @override
  Future delete(url) {
    throw UnimplementedError();
  }

  @override
  Future get(url) async{
    Response response = await dio.get(url);
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw "Network error";
    }
  }

  @override
  Future patch(url) {
    throw UnimplementedError();
  }

  @override
  Future post(url, {Map data}) async{
    Response response = await dio.post(url, data: data);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200){
      return response;
    } else{
      throw "Network error";
    }
  }

}