import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';

class SingleContent extends StatelessWidget {
  final ClassData classData;
  final String content;

  SingleContent({this.classData, this.content});

  List<Map> _getStudentsWithContent() {
    List<Map> _data = [];
    //check students who have assessment and add them to a list
    this.classData.studentData.forEach((element) {
      element.data['marks'].forEach((key, value) {
        element.data['marks'][key].forEach((assessment) {
          if (assessment['name'] == this.content) {
            _data.add({
              'assessment': assessment,
              'studentName': element.name,
            });
          }
        });
      });
    });
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> _students = _getStudentsWithContent();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${this.content}"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[400],
          ),
          ListView.builder(
            itemCount: _students.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: InkWell(
                  onTap: () {
                    return showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        _students[index]['assessment']['subs']['weight'] =
                            "${_students[index]['assessment']['weight']}%";
                        return SimpleDialog(
                          title: Text(
                            "${_students[index]['studentName']}",
                            textAlign: TextAlign.center,
                          ),
                          children: _students[index]['assessment']['subs']
                              .entries
                              .map<Widget>((e) => Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            _students[index]['studentName'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            _students[index]['assessment']['grade'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
