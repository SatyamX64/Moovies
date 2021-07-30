import 'package:findseat/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';

import 'barrel_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            WidgetHomeToolbar(),
            WidgetHomeBanner(),
            WidgetSpacer(height: 30,),
            WidgetHomeCategories(),
            WidgetRecommendedSeats(),
            WidgetNearbyTheatres(),
            WidgetHomeEvents(),
            WidgetHomePlays(),
          ],
        ),
      ),
    );
  }
}
