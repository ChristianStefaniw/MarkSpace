import 'package:dio/dio.dart';

import 'http_requests_services_interface.dart';

class HTTPRequests implements HttpRequestsInterface{

  var dio = new Dio();

  @override
  Future delete(extension) {
    throw UnimplementedError();
  }

  @override
  Future read(url) async{
    Response response = await dio.get('$url');
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw "Network error";
    }
  }

  @override
  Future update(extension) {
    throw UnimplementedError();
  }

  @override
  Future create(extension) {
    throw UnimplementedError();
  }

}