import 'package:dio/dio.dart';

import 'http_requests_interface.dart';

class HTTPRequests implements Requests{

  var dio = new Dio();
  String base = 'http://127.0.0.1:8000/api';

  @override
  Future delete(extension) {
    throw UnimplementedError();
  }

  @override
  Future read(extension) async{
    Response response = await dio.get('${this.base}/$extension');
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