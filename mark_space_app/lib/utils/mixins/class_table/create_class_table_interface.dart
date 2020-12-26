import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';

abstract class CreateClassTableInterface{
  Future<List<TableRow>> createTable(BuildContext context);

  TableRow tableRow(
      StudentProfileData profile, Color color, BuildContext context);


}