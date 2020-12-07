import 'package:flutter/material.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';

class MyInheritedWidget extends InheritedWidget {
  final List classes;
  final ClassData data;
  final Widget child;

  MyInheritedWidget({
    this.classes,
    this.data,
    this.child,
  }) : super(child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }


  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    return classes != old.classes || data != old.data;
  }
}
