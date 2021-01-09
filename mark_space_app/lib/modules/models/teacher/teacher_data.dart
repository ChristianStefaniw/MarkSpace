import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;
  final List<PreviewClass> previewClasses;
  final String id;

  TeacherData({this.email, this.name, this.classes, this.previewClasses, this.id='52ad98f3-7698-4ff3-8be6-e6c5564703d4'});
}
