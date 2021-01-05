import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/models/marks/mark_data.dart';

class MarkInformationCard extends StatelessWidget {
  final MarkData markData;

  MarkInformationCard(this.markData);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text("Grade: ${markData.grade}%", textAlign: TextAlign.center,),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: markData.subGrades.keys
                      .map(
                        (sub) =>  RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: '$sub:', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' ${markData.subGrades[sub]}'),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => print('Manage'),
                ),
              ),
            ],
          ),
        ));
  }
}
