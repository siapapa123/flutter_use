import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_use/flutter_use.dart';

import 'entity/GoodsEntity.dart';

const priceBackgroundUrl =
    'https://promotion.pddpic.com/promo/channel/62c40a2d-8309-4776-b1e2-58fa5f31aaff.png?imageView2/2/w/1300/q/70/format/webp';
const goodsBrandTagBackgroundUrl =
    'https://promotion.pddpic.com/promo/promo/cart/852c6d4f-2eb3-48db-8960-cfec6bacdba6.png.slim.png?imageView2/2/w/1300/q/70/format/webp';

class GoodsItem extends HookWidget {
  const GoodsItem({required this.goods, super.key});

  final GoodsEntity goods;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168.w,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Container(
              width: 152.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.02),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: CachedNetworkImage(
                imageUrl: _getThumbUrl(),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const SizedBox.expand(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.w,
                bottom: 8.w,
                right: 8.w,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 4.w,
                            children: goods.spikeTags
                                .map(
                                  (e) => SizedBox(
                                    height: 15.w,
                                    child:
                                        CachedNetworkImage(imageUrl: e.tagUrl),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.w),
                        child: Row(
                          children: [
                            if (goods.brand?.isNotEmpty ?? false) ...[
                              Text(
                                goods.brand ?? '',
                                style: TextStyle(
                                  color: const Color(0xffc58469),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Container(
                                  color: const Color(0x14141426),
                                  width: 0.5,
                                  height: 12.w,
                                ),
                              ),
                            ],
                            Flexible(
                              child: Text(
                                goods.goodsName ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (goods.goodsBrandTags != null)
                        Padding(
                          padding: EdgeInsets.only(top: 2.w, bottom: 3.w),
                          child: SizedBox(
                            height: 22.w,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned.fill(
                                  child: CachedNetworkImage(
                                    imageUrl: goodsBrandTagBackgroundUrl,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Row(
                                    children: [
                                      if (goods.goodsBrandTags!.mallLogo !=
                                          null) ...[
                                        Text(
                                          '来自',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff151515),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                goods.goodsBrandTags!.mallLogo!,
                                            width: 16.w,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.w),
                                          child: Text(
                                            '旗舰店',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff151515),
                                            ),
                                          ),
                                        ),
                                      ],
                                      Text(
                                        goods.goodsBrandTags!.text,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff151515),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (goods.infoTags.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 3.w,
                          ),
                          child: Row(
                            children: [
                              Text(
                                goods.infoTags.first.text,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xff9c9c9c),
                                ),
                              ),
                              if (goods.infoTags.length > 1)
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Text(
                                    goods.infoTags[1].text,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xff9c9c9c),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 18.w,
                        child: Row(
                          children: [
                            _GoodsLeftTimeWidget(
                              leftTime: goods.leftTime,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Text(
                                goods.salesTips ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xff9c9c9c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      height: 48.w,
                      width: 199.w,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CachedNetworkImage(
                              imageUrl: priceBackgroundUrl,
                              placeholder: (context, url) =>
                                  const SizedBox.expand(),
                              errorWidget: (context, url, error) =>
                                  const SizedBox.expand(),
                            ),
                          ),
                          Positioned(
                            bottom: 6.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    '券后',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffde3a2e),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Text(
                                    '¥',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffde3a2e),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 1.5.w,
                            left: 52.w,
                            child: Text(
                              goods.couponPromoPrice ?? '',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: const Color(0xffde3a2e),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getThumbUrl() {
    return goods.thumbUrl ?? (goods.hdThumbUrl ?? '');
  }
}

class _GoodsLeftTimeWidget extends HookWidget {
  const _GoodsLeftTimeWidget({
    required this.leftTime,
    super.key,
  });

  final int leftTime;

  String _getTimeString(int time) {
    if (time < 60) {
      return '$time秒';
    } else if (time < 3600) {
      return '${time ~/ 60}分${time % 60}秒';
    } else {
      return '${time ~/ 3600}时${(time % 3600) ~/ 60}分';
    }
  }

  @override
  Widget build(BuildContext context) {
    final time = useState(leftTime);
    useAliveTimer(
      1,
      callback: () {
        if (time.value > 0) {
          time.value -= 1;
        }
      },
    );

    return Row(
      children: [
        Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            '剩余',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: const Color(0x14141426),
          width: 0.5,
        ),
        Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ValueListenableBuilder(
            valueListenable: time,
            builder: (context, value, child) {
              return Text(
                _getTimeString(value),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
