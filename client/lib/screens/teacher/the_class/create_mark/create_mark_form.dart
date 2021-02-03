import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/models/marks/sub_grades.dart';
import 'package:mark_space_app/modules/providers/marks_provider.dart';
import 'package:mark_space_app/modules/providers/units_provider.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/students_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/utils/services/marks/create_mark_service.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_mark/widgets/subgrade_tag.dart';

class CreateMarkForm extends StatefulWidget {
  final String assessmentId;

  CreateMarkForm({this.assessmentId});

  @override
  _CreateMarkFormState createState() => _CreateMarkFormState();
}

class _CreateMarkFormState extends State<CreateMarkForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  final TextEditingController _markController = new TextEditingController();

  final TextEditingController _subGradesController =
      new TextEditingController();
  final TextEditingController _subGradesMarkController =
      new TextEditingController();
  final TextEditingController _commentController = new TextEditingController();

  List<SubGrade> _subGrades = [];
  StudentProfileData _student;

  void _studentAdded(BuildContext context) async {
    context.showLoaderOverlay();
    await CreateMarkService.run(
      assessmentId: this.widget.assessmentId,
      grade: _markController.text,
      subs: _subGrades,
      studentId: _student.studentId,
      comment: _commentController.text,
    );

    Provider.of<ClassDataProvider>(context, listen: false).classData =
        await Deserialize.selectClass(
            Provider.of<ClassDataProvider>(context, listen: false)
                .classData
                .id);
    Provider.of<MarksProvider>(context, listen: false).marksChanged();
    Provider.of<UnitsProvider>(context, listen: false).unitsChanged();
    Navigator.pop(context);
    context.hideLoaderOverlay();
  }

  void _addSubGrade() {
    if (_subGradesController.text.isNotEmpty &&
        !_subGrades.contains(_subGradesController.text)) {
      setState(() {
        _subGrades.add(SubGrade(mark: _subGradesMarkController.text, name: _subGradesController.text));
        _subGradesController.clear();
        _subGradesMarkController.clear();
      });
    }
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
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: SearchableDropdown.single(
                      items: Provider.of<ClassDataProvider>(context)
                          .classData
                          .students
                          .map(
                            (student) => DropdownMenuItem(
                              value: student,
                              child: Text(
                                student.name,
                                style: TextStyle(color: PRIMARY),
                              ),
                            ),
                          )
                          .toList(),
                      value: _student,
                      menuBackgroundColor: Colors.grey.withOpacity(0.1),
                      hint: Text(
                        "Student",
                        style: TextStyle(color: PRIMARY),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _student = value;
                        });
                      },
                      dialogBox: false,
                      isExpanded: true,
                      menuConstraints:
                          BoxConstraints.tight(Size.fromHeight(350)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    color: Colors.white.withOpacity(0.1),
                    child: TextFormField(
                      onFieldSubmitted: (_) {
                        _studentAdded(context);
                      },
                      style: TextStyle(color: Colors.white),
                      controller: _markController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: "Mark",
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    color: Colors.white.withOpacity(0.1),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(color: Colors.white),
                      controller: _commentController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10, bottom: 10),
                        labelText: "Comments",
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Container(
                          color: Colors.white.withOpacity(0.1),
                          child: TextFormField(
                            onFieldSubmitted: (_) {
                              _addSubGrade();
                            },
                            style: TextStyle(color: Colors.white),
                            controller: _subGradesController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: "Sub Grade Name",
                              labelStyle: TextStyle(
                                color: SECONDARY.withOpacity(0.8),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white.withOpacity(0.1),
                          child: TextFormField(
                            onFieldSubmitted: (_) {
                              _addSubGrade();
                            },
                            style: TextStyle(color: Colors.white),
                            controller: _subGradesMarkController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: "Sub Grade Mark",
                              labelStyle: TextStyle(
                                color: SECONDARY.withOpacity(0.8),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 8, right: 12),
                    child: GridView.builder(
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _subGrades.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: _subGrades.length > 0 ? 105 : 10,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7,
                          childAspectRatio: 2),
                      itemBuilder: (_, int index) {
                        return SubGradeTag(
                          subGrade: _subGrades[index],
                          onPressed: () {
                            setState(() {
                              _subGrades.remove(_subGrades[index]);
                            });
                          },
                        );
                      },
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
