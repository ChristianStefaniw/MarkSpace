abstract class HttpRequestsInterface{
  var dio;

  Future read(String extension);

  Future create(String extension);

  Future update(String extension);

  Future delete(String extension);
}