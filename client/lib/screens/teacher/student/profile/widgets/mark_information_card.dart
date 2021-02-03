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
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Grade: ${this.markData.grade}%",
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(
                color: Colors.black,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: this.markData.subGrades.map((sub) {
                        return RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${sub.name}:',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' ${sub.mark}'),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    this.markData.comment != null ? Text(this.markData.comment) : null,
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.black,
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
        ),
      ),
    );
  }
}
