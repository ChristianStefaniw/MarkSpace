import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/services/classes/deserialize_classes_units_students.dart';
import 'package:mark_space_app/utils/services/student/add_student/add_student_service.dart';
import 'package:mark_space_app/widgets/bootstrap_container.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  final String classId;
  final Function update;

  AddStudent({this.classId, this.update});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController =
      new TextEditingController();
  final TextEditingController _studentEmailController =
      new TextEditingController();

  void _studentAdded(BuildContext context) async{
    await AddStudentService.run(
      name: _studentNameController.text,
      email: _studentEmailController.text,
      classId: this.classId,
    );
    Provider.of<ClassDataProvider>(context, listen: false)
        .classData =
        await DeserializeClassesUnitsStudents.selectClass(
        this.classId);
    update();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff2b2178),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BootstrapContainer(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(bottom: 20, top: 50, right: 7, left: 7),
                  color: Colors.white.withOpacity(0.1),
                  child: TextFormField(
                    onFieldSubmitted: (_){
                      _studentAdded(context);
                    },
                    style: TextStyle(color: Colors.white),
                    controller: _studentNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      labelText: "Student's Name",
                      labelStyle: TextStyle(
                        color: SECONDARY.withOpacity(0.8),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                  color: PRIMARY.withOpacity(0.1),
                  child: TextFormField(
                    onFieldSubmitted: (_){
                      _studentAdded(context);
                    },
                    style: TextStyle(color: Colors.white),
                    controller: _studentEmailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      labelStyle: TextStyle(
                        color: SECONDARY.withOpacity(0.8),
                      ),
                      labelText: "Student's Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                  child: ButtonTheme(
                    height: 50,
                    minWidth: bootstrapMaxWidthNonFluid(
                        MediaQuery.of(context).size.width),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.check),
                      label: Text('Submit'),
                      onPressed: () async {
                        _studentAdded(context);
                      },
                      color: PRIMARY_BUTTON,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                  child: ButtonTheme(
                    height: 50,
                    minWidth: bootstrapMaxWidthNonFluid(
                        MediaQuery.of(context).size.width),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.arrow_back_rounded),
                      label: Text('Back'),
                      onPressed: () => Navigator.pop(context),
                      color: ERROR,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
