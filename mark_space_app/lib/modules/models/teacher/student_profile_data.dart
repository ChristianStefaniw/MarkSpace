import 'package:mark_space_app/utils/services/student_profile/marks.dart';

class StudentProfileData {
  final String email;
  final String name;
  final String classID;
  final List marks;
  final double average;
  final String studentId;

  StudentProfileData({this.name, this.email, this.classID, this.marks, this.average, this.studentId});

  static Future data({String email, String name, String classID, String studentId}) async{
    List _marks = await Marks.marks(classID);
    double _average = Marks.average(_marks, studentId);
    return StudentProfileData(
      email: email,
      name: name,
      classID: classID,
      marks: _marks,
      average: _average,
      studentId: studentId
    );
  }
}
