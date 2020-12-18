class StudentProfileData {
  final String email;
  final String name;
  final String classID;

  StudentProfileData({this.name, this.email, this.classID});

  Map _marks = {
    'Functions': [
      {
        'name': "Exponential Functions Unit Test",
        'grade': '84%',
        'weight': 20,
        'subs': <String, String>{'K/U': '4/5', 'APP': '9/10', 'COM': '5/7'},
      },
      {
        'name': "Trigonometric Functions Unit Test",
        'grade': '68%',
        'weight': 20,
        'subs': <String, String>{'K/U': '4/5', 'APP': '9/10', 'COM': '5/7'},
      },
    ],
    'Exam': [
      {
        'name': "Final Exam",
        'grade': '76%',
        'weight': 60,
        'subs': <String, String>{'K/U': '4/5', 'APP': '9/10', 'COM': '5/7'},
      },
    ],
  };

  double _average() {
    List _grades = [];
    _marks.forEach(
      (key, value) {
        _marks[key].forEach((element) {
          double _singleGrade =
              double.parse(element['grade'].replaceAll('%', ''));
          _grades.add(_singleGrade / 100 * element['weight'].toDouble());
        });
      },
    );
    double _average = _grades.reduce((a, b) => a + b);
    return _average;
  }

  Map get data{
    return {
      'name': this.name,
      'email': this.email,
      'marks': _marks,
      'average': _average(),
    };
  }
}
