import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;
  final List<PreviewClass> previewClasses;
  final String id;

  TeacherData({this.email, this.name, this.classes, this.previewClasses, this.id='aa8c3303-5efa-48bb-a21e-bea9af6a7b4d'});
}
