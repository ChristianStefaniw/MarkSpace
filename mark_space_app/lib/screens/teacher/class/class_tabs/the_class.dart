import 'package:flutter/material.dart';

import 'package:mark_space_app/widgets/inherited.dart';

class TheClass extends StatelessWidget {
  static const List<String> HEADINGS = ["Name", "Grade", "Email"];

  List<TableRow> createTable(BuildContext context) {
    List<TableRow> _rows = <TableRow>[
      new TableRow(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          children: HEADINGS
              .map(
                (e) => Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              .toList())
    ];

    MyInheritedWidget.of(context).data.getData().forEach((element) {
      _rows.add(_tableRow(element));
    });

    return _rows;
  }

  TableRow _tableRow(Map element) {
    return TableRow(children: [
      for (String key in element.keys)
        Container(
          height: 100,
          child: InkWell(
            child: Ink(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), color: Colors.grey),
              child: Center(
                  child: Text(
                element[key].toString(),
                textAlign: TextAlign.center,
              )),
            ),
            onTap: () => print(element['name']),
          ),
        ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(
            color: Colors.black26, width: 1, style: BorderStyle.none),
        children: createTable(context),
      ),
    );
  }
}
