import 'package:flutter/foundation.dart';

class StudentsProvider extends ChangeNotifier{
  void studentsChanged() => notifyListeners();
}