/// type : 1
/// text : "品牌秒杀"
/// tag_url : "https://promotion.pddpic.com/promo/promo/cart/5d3c1932-de77-4ca0-9d14-fcfe1e13da97.png.slim.png"
/// width : 27

class SpikeTag {
  SpikeTag({
    required int type,
    required String text,
    required String tagUrl,
    required double width,
  })  : _type = type,
        _text = text,
        _tagUrl = tagUrl,
        _width = width;

  factory SpikeTag.fromJson(Map<String, dynamic> json) => SpikeTag(
        type: json['type'] as int,
        text: json['text'] as String,
        tagUrl: json['tag_url'] as String,
        width: (json['width'] as num).toDouble(),
      );

  final int _type;
  final String _text;
  final String _tagUrl;
  final double _width;

  int get type => _type;

  String get text => _text;

  String get tagUrl => _tagUrl;

  double get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['text'] = _text;
    map['tag_url'] = _tagUrl;
    map['width'] = _width;
    return map;
  }
}
