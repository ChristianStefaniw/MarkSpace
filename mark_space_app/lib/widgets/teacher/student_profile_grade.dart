import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileGrade extends StatelessWidget {
  final Map info;

  StudentProfileGrade({this.info});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Card(
              child: InkWell(
                splashColor: Colors.grey[500],
                onTap: () => print("open test photo"),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  child: Text(
                    this.info['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: InkWell(
                splashColor: Colors.grey[500],
                onTap: () {
                  return showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      this.info['subs']['weight'] = "${this.info['weight']}%";
                      return SimpleDialog(
                        title: Text(
                          "${this.info['name']}",
                          textAlign: TextAlign.center,
                        ),
                        children: this
                            .info['subs']
                            .entries
                            .map<Widget>((e) => Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Text(
                                    "${e.key} : ${e.value}",
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  child: Text(
                    this.info['grade'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
