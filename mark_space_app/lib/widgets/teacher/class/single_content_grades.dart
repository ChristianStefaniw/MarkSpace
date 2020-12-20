import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/ui/app_dialogs/sub_marks_dialog.dart';

class SingleContentGrades extends StatelessWidget {

  final ClassData classData;
  final String unit;

  SingleContentGrades({this.classData, this.unit});

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
    return FutureBuilder<List<Map>>(
      future: this._getStudentsWithContent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map> _students = snapshot.data;
          return ListView.builder(
            itemCount: _students.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: InkWell(
                  onTap: () {
                    return subMarksSingleContentDialog(context, student: _students[index]);
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
      },
    );
  }
}
