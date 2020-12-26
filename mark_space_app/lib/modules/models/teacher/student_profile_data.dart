import 'package:mark_space_app/utils/mixins/student_profile/marks.dart';

class StudentProfileData {
  final String email;
  final String name;
  final int classID;
  final List marks;
  final double average;

  StudentProfileData({this.name, this.email, this.classID, this.marks, this.average});

  static Future data({String email, String name, int classID}) async{
    List _marks = await Marks.marks(email);
    double _average = Marks.average(_marks);
    return StudentProfileData(
      email: email,
      name: name,
      classID: classID,
      marks: _marks,
      average: _average
    );
  }
}
