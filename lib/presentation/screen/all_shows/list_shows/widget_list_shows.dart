import 'package:findseat/presentation/app_router.dart';
import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetListShow extends StatelessWidget {
  final List<ItemShowVM> items;

  WidgetListShow(this.items);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shrinkWrap: true,
      childAspectRatio: 150 / 250,
      physics: BouncingScrollPhysics(),
      children: items.map(
        (item) {
          return _WidgetItemShow(item);
        },
      ).toList(),
    );
  }
}

class _WidgetItemShow extends StatelessWidget {
  final ItemShowVM item;

  _WidgetItemShow(this.item);

  @override
  Widget build(BuildContext context) {
    void openShowDetails() {
      Navigator.pushNamed(context, AppRouter.SHOW_INFO);
    }

    return GestureDetector(
      onTap: openShowDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.photo,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 6),
          Text(item.title, style: FONT_CONST.REGULAR_BLACK2_14),
          WidgetSpacer(height: 2),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: COLOR_CONST.DEFAULT,
                size: 16,
              ),
              WidgetSpacer(width: 6),
              Text('${item.likePercent}%', style: FONT_CONST.REGULAR_GRAY6_12)
            ],
          ),
        ],
      ),
    );
  }
}

class ItemShowVM {
  String photo;
  String title;
  int likePercent;

  ItemShowVM(this.photo, this.title, this.likePercent);
}
