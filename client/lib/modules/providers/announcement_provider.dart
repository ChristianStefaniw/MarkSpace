import 'package:flutter/foundation.dart';

class AnnouncementProvider extends ChangeNotifier{
  void announcementsChanged() => notifyListeners();
}