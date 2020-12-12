class GetStudentProfileData {
  final String email;
  final String name;
  final String classID;

  GetStudentProfileData({this.name, this.email, this.classID});

  Map get data {
    Map marks = {
      'Functions': [
        {
          'name': "Exponential Functions Unit Test",
          'grade': '84%',
          'weight': 20
        },
        {
          'name': "Trigonometric Functions Unit Test",
          'grade': '68%',
          'weight': 20
        },
      ],
      'Exam': [
        {'name': "Final Exam", 'grade': '76%', 'weight': 60},
      ],
    };
    return {
      'name': this.name,
      'email': this.email,
      'marks': marks,
      'dob': DateTime.now()
    };
  }
}
