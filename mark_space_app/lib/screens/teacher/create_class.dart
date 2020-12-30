import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/utils/services/classes/create_class.dart';
import 'package:mark_space_app/widgets/teacher/bootstrap_container.dart';
import 'package:provider/provider.dart';

class CreateClass extends StatelessWidget {
  final int teacherId;

  CreateClass({this.teacherId});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _classNameController =
      new TextEditingController();
  final TextEditingController _classCodeController =
      new TextEditingController();
  final TextEditingController _classPeriodController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xff2b2178),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: BootstrapContainer(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 20, top: 50, right: 7, left: 7),
                    color: Colors.white.withOpacity(0.1),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _classNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: "Class Name",
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
                      style: TextStyle(color: Colors.white),
                      controller: _classCodeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        labelText: "Class Code",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                    color: PRIMARY.withOpacity(0.1),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _classPeriodController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        labelText: "Period",
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
                        onPressed: () async{
                          await CreateClassService.run(
                            id: this.teacherId,
                            name: _classNameController.text,
                            code: _classCodeController.text,
                            period: _classPeriodController.text,
                          );
                          Provider.of<AllClassesProvider>(context, listen: false).classesChanged();
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
        ],
      ),
    );
  }
}
