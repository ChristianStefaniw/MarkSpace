import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/modules/models/marks/sub_grades.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class CreateMarkService {
  static Future<void> run({
    String assessmentId,
    String studentId,
    grade,
    List<SubGrade> subs,
    String comment,
  }) async {
  print(subs.map((e) => e.toJson()).toList());
    Map<String, dynamic> _data =
      {
        'assessment': [assessmentId],
        'student': studentId,
        'grade': grade,
        'comment': comment,
        'subs': subs.map((e) => e.toJson()).toList(),
      };
    await HTTPRequests().post(MARKS_URL, data: _data);
  }
}
