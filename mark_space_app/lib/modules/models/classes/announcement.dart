class AnnouncementData{
  final String content;
  final String dateTime;
  final String teacher;
  final String id;

  AnnouncementData({this.content, this.dateTime, this.teacher, this.id});

  factory AnnouncementData.fromJson(Map<String, dynamic> json){
    return AnnouncementData(
      content: json['content'],
      dateTime: json['date_time'],
      teacher: json['teacher']['name'],
      id: json['id']
    );
  }
}