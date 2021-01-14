import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/marks/sub_grades.dart';

class SubGradeTag extends StatelessWidget {
  final SubGrade subGrade;
  final Function onPressed;

  const SubGradeTag({Key key, this.subGrade, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(subGrade);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(
                left: 12,
              ),
              child: Text(
                "${subGrade.name} - ${subGrade.mark}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RawMaterialButton(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              shape: CircleBorder(
                side: BorderSide(style: BorderStyle.solid, color: Colors.white),
              ),
              constraints: BoxConstraints.tightFor(height: 20, width: 20),
              onPressed: onPressed,
              child: Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
