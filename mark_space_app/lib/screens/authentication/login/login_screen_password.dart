import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:mark_space_app/screens/authentication/login/widgets/login_password.dart';
import 'package:mark_space_app/screens/authentication/widgets/background.dart';


class LoginScreenPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 1920));
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Background(),
            LoginPassword(),
          ],
        ),
      ),
    );
  }
}
