class SubGrade{
  final String name;
  final double mark;

  SubGrade({this.name, this.mark});

  factory SubGrade.fromJson(Map<String, dynamic> json){
    return SubGrade(
      name: json['sub_grade_name'],
      mark: double.parse(json['sub_grade_mark'])
    );
  }

  Map<String, dynamic> toJson(){
    return {
      this.name: this.mark
    };
  }
}