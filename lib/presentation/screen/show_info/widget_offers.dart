import 'dart:ui';

import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/custom_ui.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class WidgetOffers extends StatelessWidget {
  final Show show;

  WidgetOffers({required this.show});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      color: COLOR_CONST.WHITE,
      height: 156,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: show.offers.length,
        itemBuilder: (context, index) {
          var offer = show.offers[index];
          var iconPath = '';
          Color textColor;
          Color iconBgColor;
          switch (offer.type) {
            case OFFER_TYPE.GREEN:
              iconPath = 'assets/ic_gift.svg';
              textColor = COLOR_CONST.RED2;
              iconBgColor = COLOR_CONST.GIFT_BG1;
              break;
            case OFFER_TYPE.RED:
              iconPath = 'assets/ic_gift_green.svg';
              textColor = COLOR_CONST.GREEN2;
              iconBgColor = COLOR_CONST.GIFT_BG2;
              break;
          }

          return _WidgetGrabReward(
            iconPath: iconPath,
            textColor: textColor,
            iconBgColor: iconBgColor,
            title: offer.title,
            content: offer.content,
          );
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(width: 20);
        },
      ),
    );
  }
}

class _WidgetGrabReward extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final Color textColor;
  String title;
  String content;
  _WidgetGrabReward(
      {required this.iconPath,
      required this.iconBgColor,
      required this.textColor,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: COLOR_CONST.GRAY7,
      strokeWidth: 2,
      strokeCap: StrokeCap.butt,
      borderType: BorderType.RRect,
      dashPattern: [8, 4],
      radius: Radius.circular(6),
      child: Container(
        width: 234,
        height: 81,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 30,
                height: 53,
                decoration: BoxDecoration(
                    color: iconBgColor, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: MySvgImage(
                    path: iconPath,
                    width: 16,
                    height: 16,
                    applyColorFilter: false,
                  ),
                ),
              ),
            ),
            WidgetSpacer(width: 10),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      maxLines: 1,
                      style: FONT_CONST.OSWALD_REGULAR_RED2_12
                          .copyWith(color: textColor)),
                  Text(
                    content,
                    style: FONT_CONST.REGULAR_GRAY4_10,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
