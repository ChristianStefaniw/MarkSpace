import 'package:flutter/material.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';

class AllClassDataInherited extends InheritedWidget {
  final List<ClassData> classData;
  final Widget child;

  AllClassDataInherited({
    this.classData,
    this.child,
  }) : super(child: child);

  static AllClassDataInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AllClassDataInherited>();
  }


  @override
  bool updateShouldNotify(AllClassDataInherited old) {
    return classData != old.classData;
  }
}
