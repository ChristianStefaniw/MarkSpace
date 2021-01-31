import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/models/classes/announcement.dart';
import 'package:mark_space_app/modules/providers/announcement_provider.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';

class Announcements extends StatelessWidget {
  Widget _announcementCard(BuildContext context,
      {String teacher, String content, String dateTime}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red])),
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: PRIMARY,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "From: $teacher",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: CLASS_CARD_TITLE),
                              ),
                              Text(
                                dateTime.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: CLASS_CARD_TITLE),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
        child: Consumer<AnnouncementProvider>(builder: (_, model, child) {
          List<AnnouncementData> _announcements = Provider.of<ClassDataProvider>(context).classData.announcements;
          return ListView.builder(
            itemCount: _announcements.length,
            itemBuilder: (_, announcement) {
              return _announcementCard(context,
                  content: _announcements[announcement].content,
                  teacher: _announcements[announcement].teacher,
                  dateTime: _announcements[announcement].dateTime);
            },
          );
        }),
      ),
    );
  }
}
