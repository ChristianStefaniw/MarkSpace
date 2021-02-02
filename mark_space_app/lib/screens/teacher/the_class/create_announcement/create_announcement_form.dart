import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/constants/api_constants.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:mark_space_app/modules/providers/announcement_provider.dart';
import 'package:mark_space_app/utils/services/announcements/create_announcement_service.dart';
import 'package:mark_space_app/modules/models/teacher/teacher_data.dart';


class CreateAnnouncementForm extends StatelessWidget {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = new TextEditingController();

  Future<void> _announcementAdded(BuildContext context) async {
    context.showLoaderOverlay();

    String _classId = Provider.of<ClassDataProvider>(context, listen: false).classData.id;

    CreateAnnouncementService.run(
      content: _messageController.text,
      teacherId: TeacherData().id,
      classId: _classId
    );

    List<dynamic> _announcements = await HTTPRequests()
        .get(CLASS_QUERY_ID_URL + _classId)
        .then((value) => value[0]['announcements']);

    Provider.of<ClassDataProvider>(context, listen: false).classData.announcements = await compute(Deserialize.deserializeAnnouncements, _announcements);
    Provider.of<AnnouncementProvider>(context, listen: false).announcementsChanged();

    Navigator.pop(context);
    context.hideLoaderOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FORM_BACKGROUND,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 50, right: 7, left: 7),
                    color: Colors.white.withOpacity(0.1),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(color: Colors.white),
                      controller: _messageController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 10, bottom: 10),
                        labelText: "Message",
                        labelStyle: TextStyle(
                          color: SECONDARY.withOpacity(0.8),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.check),
                        label: Text('Submit'),
                        onPressed: () {
                          _announcementAdded(context);
                        },
                        color: PRIMARY_BUTTON,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.arrow_back_rounded),
                        label: Text('Back'),
                        onPressed: () => Navigator.pop(context),
                        color: ERROR,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
