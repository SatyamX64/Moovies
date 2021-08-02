import 'package:findseat/app_config.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'presentation/app_router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var initialRoute = context.read<AppConfig>().initialRoute;
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
  }
}
