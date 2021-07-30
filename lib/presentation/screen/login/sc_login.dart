import 'package:flutter/material.dart';
import 'package:findseat/utils/my_const/my_const.dart';

import 'barrel_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.DEFAULT,
        child: ListView(
          children: <Widget>[
            _buildTopWelcome(),
            _buildLoginForm(),
            _buildBottomSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopWelcome() => WidgetTopWelcome();

  Widget _buildLoginForm() => WidgetLoginForm();

  Widget _buildBottomSignUp() => WidgetBottomSignUp();
}
