import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/utils/services/unit/create_unit_service.dart';
import 'package:mark_space_app/modules/providers/units_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';


class CreateUnit extends StatelessWidget {

  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _unitNameController =
  new TextEditingController();


  void _unitCreated(BuildContext context) async {
    context.showLoaderOverlay();
    await CreateUnitService.run(
      name: _unitNameController.text,
      classId: Provider.of<ClassDataProvider>(context, listen: false).classData.id,
    );

    Provider.of<ClassDataProvider>(context, listen: false).classData =
    await Deserialize.selectClass(
        Provider.of<ClassDataProvider>(context, listen: false).classData.id);
    Provider.of<UnitsProvider>(context, listen: false).unitsChanged();
    Navigator.pop(context);
    context.hideLoaderOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final double _width =  bootstrapContainerWidth(
        MediaQuery.of(context).size.width);

    return Scaffold(
      backgroundColor: FORM_BACKGROUND,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: bootstrapContainerWidth(
                  MediaQuery.of(context).size.width),
              child: Column(
                children: <Widget>[
                  Container(
                    width: _width,
                    margin:
                    EdgeInsets.only(bottom: 20, top: 50, right: 7, left: 7),
                    color: Colors.white.withOpacity(0.1),
                    child: TextFormField(
                      onFieldSubmitted: (_){
                        _unitCreated(context);
                      },
                      style: TextStyle(color: Colors.white),
                      controller: _unitNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: "Unit's Name",
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: _width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                    child: ButtonTheme(
                      height: 50,
                      minWidth: double.infinity,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.check),
                        label: Text('Submit'),
                        onPressed: () {
                          _unitCreated(context);
                        },
                        color: PRIMARY_BUTTON,
                      ),
                    ),
                  ),
                  Container(
                    width: _width,
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
