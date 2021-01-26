import 'package:mark_space_app/modules/models/marks/assessment_data.dart';


// Arguments for the single assessment screen
class SingleAssessmentArguments{
  final AssessmentData assessment;
  final String unitName;

  SingleAssessmentArguments({this.assessment, this.unitName});
}