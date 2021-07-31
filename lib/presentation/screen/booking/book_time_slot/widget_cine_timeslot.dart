import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/custom_ui.dart';
import 'package:findseat/presentation/screen/booking/barrel_booking.dart';
import 'package:findseat/presentation/screen/cine_location/barrel_cine_location.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetCineTimeSlot extends StatelessWidget {
  final ItemCineTimeSlot item;

  WidgetCineTimeSlot(this.item);

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
      color: COLOR_CONST.WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(item.cineName, style: FONT_CONST.MEDIUM_BLUE_14),
              ),
              GestureDetector(
                onTap: _openCineLocation,
                child: Icon(Icons.info_outline, color: COLOR_CONST.GRAY1_50),
              ),
            ],
          ),
          WidgetSpacer(height: 4),
          Row(
            children: <Widget>[
              MySvgImage(
                path: 'assets/ic_cine_dot.svg',
                width: 9.94,
                height: 12,
                color: COLOR_CONST.GRAY1,
              ),
              WidgetSpacer(width: 7),
              Text(item.textLocation, style: FONT_CONST.REGULAR_GRAY1_12),
              WidgetSpacer(width: 11),
              Text(item.textDistance, style: FONT_CONST.REGULAR_BLACK2_10),
            ],
          ),
          WidgetSpacer(height: 16),
          Wrap(
            children: <Widget>[
              for (final item in item.timeSlots) _WidgetTimeSlot(item)
            ],
          )
        ],
      ),
    );
  }

  _openCineLocation() {
    showModalBottomSheet(
      context: _context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return CineLocationScreen();
      },
    );
  }
}

class _WidgetTimeSlot extends StatelessWidget {
  final ItemTimeSlot item;

  _WidgetTimeSlot(this.item);

  @override
  Widget build(BuildContext context) {
    var timeColor = item.hour % 2 == 0 ? COLOR_CONST.GREEN : COLOR_CONST.ORANGE;
    if (!item.active) {
      timeColor = COLOR_CONST.TIME_SLOT_BORDER;
    }

    return Container(
      width: 99,
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      margin: EdgeInsets.only(right: 13, bottom: 13),
      decoration: BoxDecoration(
          border: Border.all(
            color: COLOR_CONST.TIME_SLOT_BORDER,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: COLOR_CONST.TIME_SLOT_BG),
      child: Center(
        child: Text(
          item.time,
          style: FONT_CONST.REGULAR_BLACK2_14.copyWith(color: timeColor),
        ),
      ),
    );
  }
}

class ItemTimeSlot {
  String time;
  int hour;
  bool active;

  ItemTimeSlot(this.time, this.hour, this.active);
}
