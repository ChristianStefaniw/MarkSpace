import 'package:flutter/animation.dart';

class ScaleTransition{
  Animation<double> animation;

  ScaleTransition(AnimationController controller){
    this.animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }
}