import 'package:mark_space_app/models/teacher/class_data.dart';

class GetClasses{
  final String teacher;
  List<Map> classList;
  GetClasses({this.teacher});

  List<Map> get classes{
    /*
    forEach item in the get request:
      classList.add({"icon": icon, "period": period, "course_code": course_code,"class": class, "id": id, "classData": classData(classID)};
     */
    return classList;
  }
}