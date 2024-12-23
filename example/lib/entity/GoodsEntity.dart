import 'package:example/entity/GoodsBrandTag.dart';
import 'package:example/entity/InfoTag.dart';
import 'package:example/entity/SpikeTag.dart';

/// hdThumbUrl : "https://commimg.pddpic.com/resized-background-pic/2024-12-22/d44a71a3a903595124fba1b1d09603f8.jpeg"
/// thumbUrl : "https://img.pddpic.com/gaudit-image/2024-12-02/d426901f7e5d2b356f8023fb158027cf.jpeg"
/// salesTips : "总售23.1万+件"
/// goodsName : "Apple/苹果 iPad Air 11英寸 M2芯片 2024年新款平板电脑【10天内发货】"
/// shortName : " iPad Air6 11英寸 128G"
/// brand : "苹果"
/// couponPromoPrice : "3777"
/// discountPriceStr : "902"

List<GoodsEntity> getGoodsEntityList(List<dynamic> json) =>
    json.map((e) => GoodsEntity.fromJson(e)).toList();

class GoodsEntity {
  GoodsEntity({
    String? hdThumbUrl,
    String? thumbUrl,
    String? salesTips,
    String? goodsName,
    String? shortName,
    String? brand,
    String? couponPromoPrice,
    String? discountPriceStr,
    GoodsBrandTag? goodsBrandTags,
    List<InfoTag> infoTags = const [],
    List<SpikeTag> spikeTag = const [],
    int leftTime = 0,
  })  : _hdThumbUrl = hdThumbUrl,
        _thumbUrl = thumbUrl,
        _salesTips = salesTips,
        _goodsName = goodsName,
        _shortName = shortName,
        _brand = brand,
        _couponPromoPrice = couponPromoPrice,
        _discountPriceStr = discountPriceStr,
        _goodsBrandTags = goodsBrandTags,
        _infoTags = infoTags,
        _spikeTags = spikeTag,
        _leftTime = leftTime;

  factory GoodsEntity.fromJson(Map<String, dynamic> json) => GoodsEntity(
        hdThumbUrl: json['hdThumbUrl'] as String?,
        thumbUrl: json['thumbUrl'] as String?,
        salesTips: json['salesTips'] as String?,
        goodsName: json['goodsName'] as String?,
        shortName: json['shortName'] as String?,
        brand: json['brand'] as String?,
        couponPromoPrice: json['couponPromoPrice'] as String?,
        discountPriceStr: json['discountPriceStr'] as String?,
        goodsBrandTags: json['goodsBrandTags'] == null
            ? null
            : GoodsBrandTag.fromJson(
                json['goodsBrandTags'] as Map<String, dynamic>),
        infoTags: (json['infoTags'] as List<dynamic>?) == null
            ? const []
            : (json['infoTags'] as List<dynamic>?)!
                .map((json) => InfoTag.fromJson(json))
                .toList(),
        spikeTag: (json['spikeTags'] as List<dynamic>?) == null
            ? const []
            : (json['spikeTags'] as List<dynamic>?)!
                .map((json) => SpikeTag.fromJson(json))
                .toList(),
        leftTime: (json['leftTime'] as num).toInt(),
      );

  String? _hdThumbUrl;
  String? _thumbUrl;
  String? _salesTips;
  String? _goodsName;
  String? _shortName;
  String? _brand;
  String? _couponPromoPrice;
  String? _discountPriceStr;
  GoodsBrandTag? _goodsBrandTags;
  List<InfoTag> _infoTags;
  List<SpikeTag> _spikeTags;
  int _leftTime;

  String? get hdThumbUrl => _hdThumbUrl;

  String? get thumbUrl => _thumbUrl;

  String? get salesTips => _salesTips;

  String? get goodsName => _goodsName;

  String? get shortName => _shortName;

  String? get brand => _brand;

  String? get couponPromoPrice => _couponPromoPrice;

  String? get discountPriceStr => _discountPriceStr;

  GoodsBrandTag? get goodsBrandTags => _goodsBrandTags;

  List<InfoTag> get infoTags => _infoTags;

  List<SpikeTag> get spikeTags => _spikeTags;

  int get leftTime => _leftTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hdThumbUrl'] = _hdThumbUrl;
    map['thumbUrl'] = _thumbUrl;
    map['salesTips'] = _salesTips;
    map['goodsName'] = _goodsName;
    map['shortName'] = _shortName;
    map['brand'] = _brand;
    map['couponPromoPrice'] = _couponPromoPrice;
    map['discountPriceStr'] = _discountPriceStr;
    map['goodsBrandTags'] = _goodsBrandTags?.toJson();
    map['infoTags'] = _infoTags.map((e) => e.toJson());
    map['spikeTags'] = _spikeTags.map((e) => e.toJson());
    map['leftTime'] = _leftTime;
    return map;
  }
}
