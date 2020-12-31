import 'package:mark_space_app/constants/app_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class GetAssessments{
  static Future<List<String>> assessments(String classId) async {
    List<String> _assessments =
    await HTTPRequests().get(CLASS_QUERY_ID_URL + classId).then(
          (value) {
        List<String> _assessmentsNames = [];
        value[0]['units'].forEach(
              (unit) {
            unit['assessments'].forEach(
                  (assessment) {
                _assessmentsNames.add(assessment['name']);
              },
            );
          },
        );
        return _assessmentsNames;
      },
    );
    return _assessments;
  }
}