import 'package:mark_space_app/utils/mixins/student_profile/marks.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class StudentProfileData {
  final String email;
  final String name;
  final String classID;
  final Map marks;
  final double average;

  StudentProfileData({this.name, this.email, this.classID, this.marks, this.average});

  static Future data({String email, String name, String classID}) async{
    Map _marks = await Marks.marks(email);
    double _average = Marks.average(_marks);
    StudentProfileData(
      email: email,
      name: name,
      classID: classID,
      marks: _marks,
      average: _average
    );
  }
}
