import 'package:myseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:myseat/presentation/common_widgets/widget_spacer.dart';
import 'package:myseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetTopWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WidgetSpacer(height: 40),
        SizedBox(
          width: 172,
          child: WidgetLogoFindSeat(),
        ),
        WidgetSpacer(height: 32),
        Text('Hey there !!', style: FONT_CONST.MEDIUM_WHITE_22),
        WidgetSpacer(height: 8),
      ],
    );
  }
}
