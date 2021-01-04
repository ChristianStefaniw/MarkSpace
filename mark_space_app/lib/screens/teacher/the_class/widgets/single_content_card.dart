import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/marks/mark_data.dart';

class SingleContentCard extends StatelessWidget {
  final MarkData markData;

  SingleContentCard(this.markData);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: MaterialButton(
        onPressed: () => print(''),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/7,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  this.markData.studentName,
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 1,
                child: Text(
                  "${this.markData.grade}%",
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => print('edit'),
                  tooltip: "Manage",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
