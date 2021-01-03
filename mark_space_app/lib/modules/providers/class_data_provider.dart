import 'package:flutter/foundation.dart';

import 'package:mark_space_app/modules/models/classes/class_data.dart';

class ClassDataProvider extends ChangeNotifier {
  final ClassDataState _data = ClassDataState();

  ClassData get classData => _data.classData;

  set classData(ClassData classData) => _data.classData = classData;
}

class ClassDataState {
  ClassData classData;
}
