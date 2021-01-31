class AnnouncementData{
  final String content;
  final String dateTime;
  final String teacher;

  AnnouncementData({this.content, this.dateTime, this.teacher});

  factory AnnouncementData.fromJson(Map<String, dynamic> json){
    return AnnouncementData(
      content: json['content'],
      dateTime: json['date_time'],
      teacher: json['teacher']['name']
    );
  }
}