
import 'package:mark_space_app/modules/models/classes/announcement.dart';
import 'package:mark_space_app/modules/models/marks/unit_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';

class ClassData {
  String id;
  String code;
  String name;
  String period;
  String icon;
  List<StudentProfileData> students;
  List<UnitData> units;
  List<AnnouncementData> announcements;

  ClassData(
      {this.period, this.code, this.name, this.id, this.icon, this.students, this.units, this.announcements});

  factory ClassData.fromJson(Map<String, dynamic> json) {
    return ClassData(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      period: json['period'],
      icon: json['icon'],
      students: json['students'],
      units: json['units'],
      announcements: json['announcements']
    );
  }
}
