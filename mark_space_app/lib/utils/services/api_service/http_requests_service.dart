import 'package:dio/dio.dart';

import 'http_requests_services_interface.dart';

class HTTPRequests implements HttpRequestsInterface{

  var dio = new Dio();

  @override
  Future delete(url) {
    throw UnimplementedError();
  }

  @override
  Future read(url) async{
    Response response = await dio.get(url);
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw "Network error";
    }
  }

  @override
  Future update(url) {
    throw UnimplementedError();
  }

  @override
  Future create(url, {FormData data}) async{
    Response response = await dio.post(url, data: data);
    if (response.statusCode == 201){
      return response;
    } else{
      throw "Network error";
    }
  }

}