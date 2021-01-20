import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_assessment/widgets/student_card.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_header.dart';
import 'package:mark_space_app/config/routes/routes.dart';

class SingleAssessment extends StatelessWidget {
  final AssessmentData assessment;
  final String unitName;

  SingleAssessment(this.assessment, {this.unitName});

  List<Widget> studentCards(_) {
    return this
        .assessment
        .marks
        .map((mark) => StudentCard(
              markData: mark,
              assessmentData: this.assessment,
              unitName: this.unitName,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.unitName} - ${this.assessment.name}"),
        backgroundColor: NAVBAR,
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[0],
            label: "Add Marks",
            child: Icon(Icons.grade),
            onTap: () => Navigator.pushNamed(context, CREATE_MARK_FORM,
                arguments: this.assessment.id),
          ),
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[1],
            child: Icon(Icons.settings),
            label: "Manage",
            onTap: () => Navigator.pushNamed(context, CREATE_UNIT),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                WavyHeader(),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    gradient: LinearGradient(
                        colors: AQUA_GRADIENTS,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Text(
                    "Weight: ${this.assessment.weight}%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                ),
              ],
            ),
            Center(
              child: Container(
                width:
                    bootstrapContainerWidth(MediaQuery.of(context).size.width),
                child: FutureBuilder<List<Widget>>(
                  future: compute(studentCards, null),
                  builder: (_, cards) {
                    return cards.hasData ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cards.data.length,
                      itemBuilder: (_, card) {
                        return cards.data[card];
                      },
                    ) : Center(
                      child: SpinKitCubeGrid(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
