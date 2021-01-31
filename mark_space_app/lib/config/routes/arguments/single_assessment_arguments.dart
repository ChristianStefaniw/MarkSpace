import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/marks/unit_data.dart';


// Arguments for the single assessment screen
class SingleAssessmentArguments{
  final AssessmentData assessment;
  final UnitData unit;

  SingleAssessmentArguments({this.assessment, this.unit});
}