import 'package:flutter/foundation.dart';

class MarksProvider extends ChangeNotifier{
  bool fromProvider = false;
  void marksChanged() {
    fromProvider = true;
    notifyListeners();
  }
}