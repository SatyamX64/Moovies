import 'package:findseat/model/entity/distance_filter.dart';
import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/custom_ui.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetDistanceFilter extends StatefulWidget {
  final filters = [
    DistanceFilter(from: 2, to: 5),
    DistanceFilter(from: 5, to: 8),
    DistanceFilter(from: 8, to: 16),
    DistanceFilter(from: 16, to: 24),
  ];

  @override
  _WidgetDistanceFilterState createState() => _WidgetDistanceFilterState();
}

class _WidgetDistanceFilterState extends State<WidgetDistanceFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WrapContentHozListView(
      list: widget.filters,
      itemBuilder: (context, index) {
        var filter = widget.filters[index];
        var isSelected = selectedIndex == index;

        var itemBgColor = isSelected ? COLOR_CONST.DEFAULT : COLOR_CONST.WHITE;
        var itemBgBorderColor =
            isSelected ? COLOR_CONST.TRANS : COLOR_CONST.DEFAULT_BORDER;
        var textColor = isSelected ? COLOR_CONST.WHITE : COLOR_CONST.GRAY1;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: itemBgColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: itemBgBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text('${filter.from} - ${filter.to} kms',
                  style: FONT_CONST.MEDIUM_WHITE_12.copyWith(color: textColor)),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(width: 10);
      },
    );
  }
}
