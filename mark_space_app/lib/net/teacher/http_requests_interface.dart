abstract class Requests{
  var dio;

  String base;

  Future read(String extension);

  Future create(String extension);

  Future update(String extension);

  Future delete(String extension);
}