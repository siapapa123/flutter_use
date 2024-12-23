/// type : 3001
/// text : "100%正品"
/// mall_logo : "https://img.pddpic.com/goods_mms/2022-12-30/6aeb9bc7-87b4-4e0c-a7c2-884d942d64aa_suffix.jpeg"
/// mall_name : "费列罗巧克力官方旗舰店"

class GoodsBrandTag {
  GoodsBrandTag({
    required int type,
    required String text,
    String? mallLogo,
    String? mallName,
  })  : _type = type,
        _text = text,
        _mallLogo = mallLogo,
        _mallName = mallName;

  factory GoodsBrandTag.fromJson(Map<String, dynamic> json) => GoodsBrandTag(
        type: json['type'] as int,
        text: json['text'] as String,
        mallLogo: json['mall_logo'] as String?,
        mallName: json['mall_name'] as String?,
      );

  int _type;
  String _text;
  String? _mallLogo;
  String? _mallName;

  int get type => _type;

  String get text => _text;

  String? get mallLogo => _mallLogo;

  String? get mallName => _mallName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['text'] = _text;
    map['mall_logo'] = _mallLogo;
    map['mall_name'] = _mallName;
    return map;
  }

}