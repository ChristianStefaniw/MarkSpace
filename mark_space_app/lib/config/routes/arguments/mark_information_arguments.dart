import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';


// Arguments for the mark information screen
class MarkInformationArguments{
  final AssessmentData assessmentData;
  final String unitName;
  final StudentProfileData student;

  MarkInformationArguments({this.assessmentData, this.unitName, this.student});

}