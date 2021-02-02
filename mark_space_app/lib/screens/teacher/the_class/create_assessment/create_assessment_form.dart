import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/utils/services/assessments/create_assessment_service.dart';
import 'package:mark_space_app/modules/providers/units_provider.dart';

class CreateAssessmentForm extends StatelessWidget {

  final String unitId;
  CreateAssessmentForm({this.unitId});

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _assessmentNameController =
  new TextEditingController();
  final TextEditingController _assessmentWeightController =
  new TextEditingController();

  void _assessmentAdded(BuildContext context) async {
    context.showLoaderOverlay();
    await CreateAssessmentService.run(
      name: _assessmentNameController.text,
      unitId: this.unitId,
      weight: _assessmentWeightController.text,
      classId: Provider.of<ClassDataProvider>(context, listen: false)
          .classData
          .id,
    );

    Provider.of<ClassDataProvider>(context, listen: false).classData =
    await Deserialize.selectClass(
        Provider.of<ClassDataProvider>(context, listen: false)
            .classData
            .id);
    Provider.of<UnitsProvider>(context, listen: false).unitsChanged();
    Navigator.pop(context);
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
                        _assessmentAdded(context);
                      },
                      style: TextStyle(color: Colors.white),
                      controller: _assessmentNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: "Assessment's Name",
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
                        _assessmentAdded(context);
                      },
                      style: TextStyle(color: Colors.white),
                      controller: _assessmentWeightController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        labelText: "Assessment's Weight",
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
                        onPressed: () {
                          _assessmentAdded(context);
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
