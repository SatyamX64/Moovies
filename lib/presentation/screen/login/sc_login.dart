import 'package:findseat/model/repo/user_repository.dart';
import 'package:findseat/presentation/screen/login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'barrel_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginBloc(userRepository: userRepository),
        child: Container(
          color: COLOR_CONST.DEFAULT,
          child: ListView(
            children: <Widget>[
              _buildTopWelcome(),
              _buildLoginForm(),
              _buildBottomSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopWelcome() => WidgetTopWelcome();

  Widget _buildLoginForm() => WidgetLoginForm();

  Widget _buildBottomSignUp() => WidgetBottomSignUp();
}
