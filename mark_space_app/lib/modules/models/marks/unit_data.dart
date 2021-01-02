class UnitData{
  final String name;
  final List<dynamic> assessments;
  final double weight;

  UnitData({this.name, this.assessments, this.weight});

  factory UnitData.fromJson(Map<String, dynamic> json){
    return UnitData(name: json['name'], assessments: json['assessments'], weight: json['weight']);
  }
}