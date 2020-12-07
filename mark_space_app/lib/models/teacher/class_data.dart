class ClassData{
  final String classID;
  List<Map> data = [{"name": "Christian Stefaniw", "mark": '83%', "email": "christian.stefaniw@student.tdsb.on.ca", }, {"name": "Christian Stefaniw", "mark": '83%', "email": "christian.stefaniw@student.tdsb.on.ca", }];
  ClassData({this.classID});

  String get id => this.classID;

  List getData(){
    //TODO get each person in class -> marks, name, email, etc

    /*
    forEach item in get request:
      data.add({"person":{"mark": mark, "name": name, "email": email}
     */


    return data;
  }
}