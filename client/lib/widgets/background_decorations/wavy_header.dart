import 'package:flutter/material.dart';

import 'clippers/top_wave_clipper.dart';
import 'package:mark_space_app/config/theme/colors.dart';

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: ORANGE_GRADIENTS,
              begin: Alignment.topLeft,
              end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}
