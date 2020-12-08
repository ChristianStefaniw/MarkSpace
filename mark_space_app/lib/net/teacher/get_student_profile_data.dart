class GetStudentProfileData{
  final String email;
  final String name;
  final classID;

  GetStudentProfileData({this.name, this.email, this.classID});

  Map get data{
    List marks = [{"Exponential Functions Unit Test": '84%', "Final Exam": '76%'}];
    return {'name': this.name, 'email': this.email, 'marks': marks, 'dob': DateTime.now()};
  }
}