class SubGrade{
  final name;
  final mark;

  SubGrade({this.name, this.mark});

  factory SubGrade.fromJson(Map<String, dynamic> json){
    return SubGrade(
      name: json['name'],
      mark: double.parse(json['mark'])
    );
  }

  Map<String, dynamic> toJson(){
    return {
      this.name: this.mark
    };
  }
}