import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/mixins/classes/get_classes.dart';

class TeacherData {
  final String email;
  final String name;
  final List<ClassData> classes;

  TeacherData({this.email, this.name, this.classes});

  static Future<TeacherData> getClasses({String email, String name}) async{
    List<ClassData> _classes = await GetClasses(email).classes();
    return new TeacherData(email: email, name: name, classes: _classes);
  }

}
