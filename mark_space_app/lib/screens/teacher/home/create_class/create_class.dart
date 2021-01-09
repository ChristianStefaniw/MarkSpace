import 'package:flutter/material.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/utils/services/classes/create_class_service.dart';


class CreateClass extends StatelessWidget {
  final String teacherId;

  CreateClass({this.teacherId});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _classNameController =
      new TextEditingController();
  final TextEditingController _classCodeController =
      new TextEditingController();
  final TextEditingController _classPeriodController =
      new TextEditingController();


  void _classCreated(BuildContext context) async{
    context.showLoaderOverlay();
    await CreateClassService.run(
      teacherId: this.teacherId,
      name: _classNameController.text,
      code: _classCodeController.text,
      period: _classPeriodController.text,
    );
    Provider.of<AllClassesProvider>(context, listen: false)
        .classesChanged();
    context.hideLoaderOverlay();
    Navigator.pop(context);
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
                      onFieldSubmitted: (_){
                        _classCreated(context);
                      },
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
                      onFieldSubmitted: (_){
                        _classCreated(context);
                      },
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
                      minWidth: double.infinity,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.check),
                        label: Text('Submit'),
                        onPressed: () async {
                          _classCreated(context);
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
