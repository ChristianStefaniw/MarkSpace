import 'package:flutter/foundation.dart';

import 'package:mark_space_app/modules/models/classes/class_data.dart';

class ClassDataProvider extends ChangeNotifier {
  ClassData _data;

  ClassData get classData => _data;

  set classData(ClassData classData) => _data = classData;
}
