import 'package:flutter/material.dart';


class AverageLabel extends StatelessWidget {
  final double avg;

  AverageLabel(this.avg);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Average: ${this.avg}%"),
    );
  }
}
