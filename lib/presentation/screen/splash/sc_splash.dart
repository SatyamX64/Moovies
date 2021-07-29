import 'package:flutter_svg/flutter_svg.dart';
import 'package:myseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.DEFAULT,
        child: Center(
          child: SvgPicture.asset(
            'assets/logo_find_seat.svg',
            color: COLOR_CONST.WHITE,
          ),
        ),
      ),
    );
  }
}
