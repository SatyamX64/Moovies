import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/custom_ui/custom_ui.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetToolbar extends StatelessWidget {
  final String title;
  final Widget actions;

  WidgetToolbar({required this.title,required this.actions});

  WidgetToolbar.defaultActions({required this.title}) : actions = _buildActions();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.BLUE,
      height: 50,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 10),
              child: MySvgImage(
                width: 19,
                height: 16,
                path: 'assets/ic_back.svg',
              ),
            ),
          ),
          Expanded(
            child: Text(title, style: FONT_CONST.MEDIUM_WHITE_16),
          ),
          actions,
        ],
      ),
    );
  }

  static Widget _buildActions() {
    return Row(
      children: <Widget>[
        MySvgImage(
          path: "assets/ic_search.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(width: 12),
        MySvgImage(
          path: "assets/ic_more.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(width: 12)
      ],
    );
  }
}
