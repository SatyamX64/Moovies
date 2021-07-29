import 'package:flutter/material.dart';
import 'package:myseat/utils/my_const/my_const.dart';

class WidgetBottomSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24,bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Text(
              'Don\'t have an account ?',
              style: FONT_CONST.REGULAR_WHITE_10,
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Sign up',
                style: FONT_CONST.SEMIBOLD_WHITE_10.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text('Here', style: FONT_CONST.SEMIBOLD_WHITE_10),
          ),
        ],
      ),
    );
  }
}
