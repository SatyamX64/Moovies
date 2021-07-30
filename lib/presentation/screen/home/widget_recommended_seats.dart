import 'package:flutter/material.dart';
import 'package:findseat/presentation/app_router.dart';
import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/utils/my_const/my_const.dart';

class WidgetRecommendedSeats extends StatelessWidget {
  final items = [
    _ItemRecommendedSeatVM(
        "images/movie/fdf8fabbc12db9cddc60574f691d26c6@2x.png", "Bigil", 84),
    _ItemRecommendedSeatVM(
        "images/movie/d4baeb81488e83cb54f041917ff62f59@2x.png", "Kaithi", 98),
    _ItemRecommendedSeatVM(
        "images/movie/61d30e82f43b1cab9f49e576ae457086@2x.png", "Asuran", 94),
    _ItemRecommendedSeatVM(
        "images/movie/3890dc6228535cbf5eebd947738d4e52@2x.png", "Sarkar", 87)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Recommended Seats'.toUpperCase(),
              style: FONT_CONST.MEDIUM_BLACK2_14),
          WidgetSpacer(height: 14),
          _buildListRecommendedSeats(),
        ],
      ),
    );
  }

  Widget _buildListRecommendedSeats() {
    return Container(
      height: 166,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemRecommendedSeat(item);
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

class _WidgetItemRecommendedSeat extends StatelessWidget {
  final _ItemRecommendedSeatVM item;

  _WidgetItemRecommendedSeat(this.item);

  @override
  Widget build(BuildContext context) {
    void openShowDetails() {
      Navigator.pushNamed(context, AppRouter.ALL_SHOWS);
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
              width: 93,
              height: 124,
              fit: BoxFit.contain,
            ),
          ),
          WidgetSpacer(height: 6),
          Text(item.title, style: FONT_CONST.REGULAR_BLACK2_12),
          WidgetSpacer(height: 2),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: COLOR_CONST.DEFAULT,
                size: 14,
              ),
              WidgetSpacer(width: 6),
              Text('${item.likePercent}%', style: FONT_CONST.REGULAR_GRAY6_10)
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemRecommendedSeatVM {
  String photo;
  String title;
  int likePercent;

  _ItemRecommendedSeatVM(this.photo, this.title, this.likePercent);
}
