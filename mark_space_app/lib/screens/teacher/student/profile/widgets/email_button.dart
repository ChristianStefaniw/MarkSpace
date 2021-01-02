import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailButton extends StatelessWidget {

  final String email;

  EmailButton(this.email);

  _sendMail(String email) async {
    final uri = "mailto:$email";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => this._sendMail(this.email),
      child: Container(
        child: Text("Email: ${this.email}"),
      ),
    );
  }
}
