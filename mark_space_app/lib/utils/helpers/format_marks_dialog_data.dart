class FormatMarksDialogData {
  static format(Map<String, dynamic> assessment) {
    Map _formatted = {};
    _formatted
        .addAll({'grade': assessment['marks'][0]['grade']});

    _formatted.addAll({'weight': assessment['weight']});

    assessment['marks'][0]['subs'].forEach(
      (sub, mark) {
        _formatted.addAll({sub: mark});
      },
    );
    return _formatted;
  }
}
