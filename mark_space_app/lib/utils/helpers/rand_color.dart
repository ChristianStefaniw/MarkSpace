import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';

class RandColor{

  static final RandColor _singleton = RandColor._internal();
  factory RandColor() => _singleton;
  RandColor._internal();

  Random random = new Random();

  Color color(List<MaterialColor> colors){
    return colors[random.nextInt(STUDENT_CARD_COLORS.length - 1)];
  }
}