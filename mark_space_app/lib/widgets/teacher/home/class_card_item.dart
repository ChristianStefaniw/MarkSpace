import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassCardItem extends StatelessWidget {
  final EdgeInsets margin;
  final String title;
  final String contents;
  final double fontSize;
  final Color fontColor;

  ClassCardItem(
      {Key key,
      this.margin,
      this.title,
      this.contents,
      this.fontSize,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      width: 150,
      decoration: BoxDecoration(
        border: Border.symmetric(vertical: BorderSide(color: Colors.grey[400])),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                textAlign: TextAlign.center,
              ),
              Text(
                this.contents,
                style: GoogleFonts.montserrat(
                  color: this.fontColor,
                  fontSize: this.fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
