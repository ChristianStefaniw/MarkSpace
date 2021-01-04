import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/classes/preview_class.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;
  final List<PreviewClass> previewClasses;
  final String id;

  TeacherData({this.email, this.name, this.classes, this.previewClasses, this.id='65ddded4-0a05-4d72-a7e0-452ea01025db'});
}
