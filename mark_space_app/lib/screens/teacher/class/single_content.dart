import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';

class SingleContent extends StatelessWidget {
  final ClassData classData;
  final String unit;

  SingleContent({this.classData, this.unit});

  Future<List<Map>> _getStudentsWithContent() async {
    List<Map> _data = [];
    //check students who have assessment and add them to a list
    for (final profile in this.classData.studentData) {
      await profile.data.then(
        (value) => value['marks'].forEach(
          (unit, content) {
            content.forEach(
              (assessment) {
                if (assessment['name'] == this.unit) {
                  _data.add(
                    {
                      'assessment': assessment,
                      'studentName': profile.name,
                    },
                  );
                }
              },
            );
          },
        ),
      );
    }
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${this.unit}"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[400],
          ),
          FutureBuilder<List<Map>>(
              future: _getStudentsWithContent(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Map> _students = snapshot.data;
                  return ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            return showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                _students[index]['assessment']['subs']
                                        ['weight'] =
                                    "${_students[index]['assessment']['weight']}%";
                                return SimpleDialog(
                                  title: Text(
                                    "${_students[index]['studentName']}",
                                    textAlign: TextAlign.center,
                                  ),
                                  children:
                                      _students[index]['assessment']['subs']
                                          .entries
                                          .map<Widget>((e) => Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10.h),
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
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
