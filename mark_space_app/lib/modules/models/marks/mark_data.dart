class MarkData{
  final Map<String, dynamic> subGrades;
  final double grade;
  final String studentName;

  MarkData({this.subGrades, this.grade, this.studentName});

  factory MarkData.fromJson(Map<String, dynamic> json){
    return MarkData(
      subGrades: json['subs'],
      grade: json['grade'],
      studentName: json['student']['name'],
    );
  }

}