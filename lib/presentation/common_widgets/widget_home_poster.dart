import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/svg_image.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetHomePosters extends StatelessWidget {
  late final List<ItemPosterVM> items;

  final String label;
  final String iconPath;

  WidgetHomePosters(
      {required this.items, required this.label, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              MySvgImage(
                path: iconPath,
                width: 20,
                height: 20,
                color: COLOR_CONST.BLACK2,
              ),
              WidgetSpacer(width: 6),
              Expanded(
                child: Text(label.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
              ),
              Expanded(
                child: Text('View all',
                    style: FONT_CONST.MEDIUM_DEFAULT_10,
                    textAlign: TextAlign.right),
              )
            ],
          ),
          WidgetSpacer(height: 14),
          _buildListPoster(),
        ],
      ),
    );
  }

  Widget _buildListPoster() {
    return Container(
      height: 186,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemPoster(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 14);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}

class _WidgetItemPoster extends StatelessWidget {
  final ItemPosterVM item;

  _WidgetItemPoster(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.photo,
              width: 93,
              height: 124,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 6),
          Text(item.title,
              style: FONT_CONST.REGULAR_BLACK2_12,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          WidgetSpacer(height: 2),
          Text(item.subTitle, style: FONT_CONST.REGULAR_GRAY6_10),
        ],
      ),
    );
  }
}

class ItemPosterVM {
  String title;
  String subTitle;
  String photo;

  ItemPosterVM(this.photo, this.title, this.subTitle);
}
