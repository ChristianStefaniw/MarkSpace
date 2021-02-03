import 'package:dio/dio.dart';

class HTTPRequests{

  static final HTTPRequests _singleton = HTTPRequests._internal();
  factory HTTPRequests() => _singleton;
  HTTPRequests._internal();

  Dio dio = new Dio();

  Future delete(url) async{
    Response response = await dio.delete(url);
    if (response.statusCode == 204){
      return;
    } else {
      throw "Network error";
    }
  }

  Future get(url, {String condition}) async{

    Response response = await dio.get(url + '&condition=$condition');


    if (response.statusCode == 200){
      return response.data;
    } else {
      throw "Network error";
    }
  }

  Future patch(url) {
    throw UnimplementedError();
  }

  Future post(url, {data}) async{
    Response response = await dio.post(url, data: data);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200){
      return response;
    } else{
      throw "Network error";
    }
  }

}