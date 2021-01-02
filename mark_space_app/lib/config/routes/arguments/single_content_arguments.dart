import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/marks/unit_data.dart';

class SingleContentArguments{
  final ClassData classData;
  final AssessmentData assessment;

  SingleContentArguments({this.classData, this.assessment});
}