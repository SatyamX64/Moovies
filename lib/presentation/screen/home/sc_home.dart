import 'package:findseat/presentation/common_widgets/widget_spacer.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'barrel_home.dart';
import 'home_banner/bloc/bloc.dart';
import 'home_categories/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeBannerBloc(homeBloc: BlocProvider.of<HomeBloc>(context))),
        BlocProvider(
            create: (context) =>
                HomeCategoryBloc(homeBloc: BlocProvider.of<HomeBloc>(context))),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  body: Container(
            color: COLOR_CONST.WHITE,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                WidgetHomeToolbar(),
                _buildContent(state),
              ],
            ),
          )));
        },
      ),
    );
  }

  Widget _buildContent(HomeState state) {
    if (state is HomeLoaded) {
      return Expanded(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            WidgetHomeBanner(),
            WidgetSpacer(height: 30),
            WidgetHomeCategories(),
            WidgetSpacer(height: 30),
            WidgetRecommendedSeats(),
            WidgetSpacer(height: 30),
            WidgetNearbyTheatres(),
            WidgetSpacer(height: 30),
            WidgetHomeEvents(),
            WidgetSpacer(height: 30),
            WidgetHomePlays(),
            WidgetSpacer(height: 30),
          ],
        ),
      );
    } else if (state is HomeLoading) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is HomeNotLoaded) {
      return Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Text('Unknown state'),
        ),
      );
    }
  }
}
