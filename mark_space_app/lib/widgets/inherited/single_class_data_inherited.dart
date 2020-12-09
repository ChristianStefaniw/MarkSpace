import 'package:flutter/material.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';

class SingleClassDataInherited extends InheritedWidget {
  final ClassData classData;
  final Widget child;

  SingleClassDataInherited({
    this.classData,
    this.child,
  }) : super(child: child);

  static SingleClassDataInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SingleClassDataInherited>();
  }


  @override
  bool updateShouldNotify(SingleClassDataInherited old) {
    return classData != old.classData;
  }
}
