import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/widgets/background_decorations/circle_pink.dart';
import 'package:mark_space_app/widgets/background_decorations/circle_yellow.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_footer.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_header.dart';

///CODE CREDITS TO https://github.com/SubirZ

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/collaboration.png',
                width: 350.h,
              ),
              WavyHeader(),
            ],
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              WavyFooter(),
              CirclePink(),
              CircleYellow(),
            ],
          )
        ],
      ),
    );
  }
}




