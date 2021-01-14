import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/services/student/add_student/add_student_service.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/students_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';

class AddStudentForm extends StatelessWidget {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController =
      new TextEditingController();
  final TextEditingController _studentEmailController =
      new TextEditingController();

  void _studentAdded(BuildContext context) async {
    context.showLoaderOverlay();
    await AddStudentService.run(
      name: _studentNameController.text,
      email: _studentEmailController.text,
      classId:
          Provider.of<ClassDataProvider>(context, listen: false).classData.id,
    );

    Provider.of<ClassDataProvider>(context, listen: false).classData =
        await Deserialize.selectClass(
            Provider.of<ClassDataProvider>(context, listen: false)
                .classData
                .id);
    Provider.of<StudentsProvider>(context, listen: false).studentsChanged();
    Navigator.pop(context);
    context.hideLoaderOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FORM_BACKGROUND,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 20, top: 50, right: 7, left: 7),
                    color: Colors.white.withOpacity(0.1),
                    child: TextFormField(
                      onFieldSubmitted: (_) {
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
                      onFieldSubmitted: (_) {
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
                      minWidth: double.infinity,
                      height: 50,
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
                      minWidth: double.infinity,
                      height: 50,
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
      ),
    );
  }
}
