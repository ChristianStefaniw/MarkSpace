import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;
  final List<PreviewClass> previewClasses;
  final String id;

  TeacherData({this.email, this.name, this.classes, this.previewClasses, this.id='82ea5e52-7020-438e-96c9-3bd4f14a3454'});
}
