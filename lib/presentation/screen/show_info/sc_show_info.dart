import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/presentation/app_router.dart';
import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/custom_ui.dart';
import 'package:findseat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:findseat/presentation/screen/show_info/widget_video_player.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ShowInfoScreen extends StatelessWidget {
  late BuildContext _context;
  final Show show;

  ShowInfoScreen({required this.show});

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                WidgetVideoPlayer(videoUrl: show.trailer),
                WidgetShowDesc(show: show),
                WidgetSpacer(height: 14),
                WidgetOffers(),
                WidgetSpacer(height: 14),
                WidgetShowReview(),
                WidgetSpacer(height: 14),
                WidgetShowCasts(),
                WidgetSpacer(
                  height: 70,
                ),
              ],
            ),
            _buildBtnBookSeat(),
          ],
        ),
      ),
    );
  }

  void openBookCineTimeSlot() {
    Navigator.pushNamed(_context, AppRouter.BOOK_TIME_SLOT);
  }

  Widget _buildBtnBookSeat() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: COLOR_CONST.DEFAULT,
              elevation: 0,
              shape: RoundedRectangleBorder()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySvgImage(
                width: 18.25,
                height: 16.1,
                path: 'assets/ic_sofa.svg',
              ),
              WidgetSpacer(width: 5),
              Text('Book seats', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: openBookCineTimeSlot,
        ),
      ),
    );
  }
}
