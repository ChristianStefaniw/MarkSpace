import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/modules/models/classes/announcement.dart';
import 'package:mark_space_app/modules/providers/announcement_provider.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/services/announcements/delete_announcement_service.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';


class AnnouncementCard extends StatelessWidget {

  final AnnouncementData announcementData;
  AnnouncementCard(this.announcementData);

  @override
  Widget build(BuildContext context) {
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
                                  this.announcementData.teacher,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: CLASS_CARD_TITLE),
                                ),
                                Text(
                                  this.announcementData.dateTime.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: CLASS_CARD_TITLE),
                                ),
                                IconButton(
                                    icon: Icon(Icons.restore_from_trash),
                                    tooltip: "Delete",
                                    onPressed: () async{
                                      context.showLoaderOverlay();
                                      await DeleteAnnouncementService.run(this.announcementData.id);
                                      List<dynamic> _announcements = await HTTPRequests()
                                          .get(CLASS_QUERY_ID_URL + Provider.of<ClassDataProvider>(context, listen: false).classData.id)
                                          .then((value) => value[0]['announcements']);
                                      Provider.of<ClassDataProvider>(context, listen: false).classData.announcements = Deserialize.deserializeAnnouncements(_announcements);
                                      Provider.of<AnnouncementProvider>(context, listen: false).announcementsChanged();
                                      context.hideLoaderOverlay();
                                    })
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              this.announcementData.content,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
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
}
