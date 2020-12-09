class ClassData {
  final String id;
  final String code;
  final String name;
  final String period;
  final String icon;

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

  ClassData({this.period, this.code, this.name, this.id, this.icon});


  List get studentData {
    //TODO get each person in class -> marks, name, email, etc

    /*
    forEach item in get request:
      data.add({"person":{"mark": mark, "name": name}
     */

    return _data;
  }
}
