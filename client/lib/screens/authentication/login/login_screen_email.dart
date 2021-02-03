import 'package:flutter/material.dart';

import 'package:mark_space_app/screens/authentication/login/widgets/login_email.dart';
import 'package:mark_space_app/screens/authentication/widgets/background.dart';


///CODE CREDITS TO https://github.com/SubirZ


class LoginScreenEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Background(),
            LoginEmail(),
          ],
        ),
      ),
    );
  }
}
