class SubGrade{
  final name;
  final mark;

  SubGrade({this.name, this.mark});

  factory SubGrade.fromJson(Map<String, dynamic> json){
    return SubGrade(
      name: json['name'],
      mark: json['mark'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': this.name,
      'mark': this.mark,
    };
  }
}