import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';

class DeleteAnnouncementService{
  static Future<void> run(String id) async{
    await HTTPRequests().delete(ANNOUNCEMENT_URL + id + '/');
  }
}