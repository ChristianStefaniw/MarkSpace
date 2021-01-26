import 'package:mark_space_app/modules/models/marks/assessment_data.dart';


// Arguments for the mark information screen
class MarkInformationArguments{
  final AssessmentData assessmentData;
  final String unitName;
  final String studentName;

  MarkInformationArguments({this.assessmentData, this.unitName, this.studentName});

}