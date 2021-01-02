import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:mark_space_app/screens/authentication/widgets/background.dart';
import 'package:mark_space_app/screens/authentication/widgets/login.dart';


///CODE CREDITS TO https://github.com/SubirZ


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 1920));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background(),
          Login(),
        ],
      ),
    );
  }
}
