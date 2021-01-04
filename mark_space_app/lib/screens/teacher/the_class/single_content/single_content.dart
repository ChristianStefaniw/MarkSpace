import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_content/widgets/single_content_card.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_header.dart';
import 'package:mark_space_app/widgets/bootstrap_container.dart';

class SingleContent extends StatelessWidget {
  final AssessmentData assessment;
  final String unitName;

  SingleContent(this.assessment, {this.unitName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.unitName} - ${this.assessment.name}"),
        backgroundColor: NAVBAR,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => print('edit assessment'),
            tooltip: "Manage",
          )
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
                        colors: assessmentInfo,
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
            BootstrapContainer(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: this.assessment.marks.length,
                  itemBuilder: (_, index) {
                    return SingleContentCard(this.assessment.marks[index]);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
