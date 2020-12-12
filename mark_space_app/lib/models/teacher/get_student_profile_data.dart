class GetStudentProfileData {
  final String email;
  final String name;
  final String classID;

  GetStudentProfileData({this.name, this.email, this.classID});

  Map get data {
    Map marks = {
      'Functions': {
        "Exponential Functions Unit Test": '84%',
        "Trigonometric Functions Unit Test": '68%'
      },
      'Exam': {"Final Exam": '76%'}
    };
    return {
      'name': this.name,
      'email': this.email,
      'marks': marks,
      'dob': DateTime.now()
    };
  }
}
