class SubGrade{
  final String name;
  final mark;

  SubGrade({this.name, this.mark});

  Map<String, dynamic> toJson(){
    return {
      this.name: this.mark
    };
  }
}