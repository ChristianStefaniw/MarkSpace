import 'package:flutter/foundation.dart';

class MarksProvider extends ChangeNotifier{
  void marksChanged() => notifyListeners();
}