/// type : 2100
/// text : "好评率超97%同款"

class InfoTag {
  InfoTag({
    required int type,
    required String text,
  }) : _type = type, _text = text;

  factory InfoTag.fromJson(Map<String, dynamic> json) => InfoTag(
        type: json['type'] as int,
        text: json['text'] as String,
      );

  final int _type;
  final String _text;

  int get type => _type;

  String get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['text'] = _text;
    return map;
  }
}
