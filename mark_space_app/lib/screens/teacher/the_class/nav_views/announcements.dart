import 'package:flutter/material.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/widgets/announcements/announcement_card.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/modules/models/classes/announcement.dart';
import 'package:mark_space_app/modules/providers/announcement_provider.dart';
import 'package:mark_space_app/utils/services/announcements/delete_announcement_service.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';


class Announcements extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
        child: Consumer<AnnouncementProvider>(builder: (_, model, child) {
          List<AnnouncementData> _announcements =
              Provider.of<ClassDataProvider>(context).classData.announcements;
          return ListView.builder(
            itemCount: _announcements.length,
            itemBuilder: (_, announcement) {
              return AnnouncementCard(_announcements[announcement]);
            },
          );
        }),
      ),
    );
  }
}
