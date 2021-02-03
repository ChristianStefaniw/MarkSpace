class PreviewClass{
  final String name;
  final String period;
  final String code;
  final String icon;
  final String id;

  PreviewClass({this.name, this.period, this.code, this.icon, this.id});

  factory PreviewClass.fromJson(Map<String, dynamic> json){
    return PreviewClass(
      name: json['name'],
      period: json['period'],
      code: json['code'],
      icon: json['icon'],
      id: json['id'],
    );
  }
}