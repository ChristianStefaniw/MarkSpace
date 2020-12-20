import 'package:dio/dio.dart';

import 'http_requests_services_interface.dart';
import 'package:mark_space_app/constants/api_path.dart';

class HTTPRequests implements HttpRequestsInterface{

  var dio = new Dio();

  @override
  Future delete(extension) {
    throw UnimplementedError();
  }

  @override
  Future read(extension) async{
    Response response = await dio.get('$API_PATH/$extension');
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