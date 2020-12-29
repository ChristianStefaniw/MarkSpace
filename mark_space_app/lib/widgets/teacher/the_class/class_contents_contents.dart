import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';

class TheClassContentsContents extends StatelessWidget {
  final ClassData classData;

  TheClassContentsContents(this.classData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: this.classData.assessments,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                elevation: 10,
                child: InkWell(
                  splashColor: SECONDARY_LIGHT,
                  onTap: () => Navigator.pushNamed(
                    context,
                    SINGLE_CONTENT,
                    arguments: SingleContentArguments(
                      classData: this.classData,
                      unit: snapshot.data[index],
                    ),
                  ),
                  child: Ink(
                    color: PRIMARY,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: Text(
                      snapshot.data[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
