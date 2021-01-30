import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;
  final List<PreviewClass> previewClasses;
  final String id;

  TeacherData({this.email, this.name, this.classes, this.previewClasses, this.id='780bdc0a-7127-4344-bff5-9d7d7f5a2567'});
}
