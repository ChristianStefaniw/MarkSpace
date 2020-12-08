class ClassData {
  final String classID;
  final String classCode;
  final String className;
  final String classPeriod;

  List<Map> _data = [
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Bob Joe", "mark": '54%', "email": 'bob.joe@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
    {"name": "Christian Stefaniw", "mark": '83%', "email": 'christian.stefaniw@student.tdsb.on.ca'},
  ];

  ClassData({this.classPeriod, this.classCode, this.className, this.classID});

  String get id => this.classID;
  String get code => this.classCode;
  String get name => this.className;
  String get period => this.classPeriod;

  List getData() {
    //TODO get each person in class -> marks, name, email, etc

    /*
    forEach item in get request:
      data.add({"person":{"mark": mark, "name": name}
     */

    return _data;
  }
}
