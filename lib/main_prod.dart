import 'package:findseat/app_config.dart';
import 'package:findseat/presentation/app_router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() async{
  await MyApp.initSystemDefault();

  runApp(AppConfig(
    appName: "FindSeat",
    flavorName: "prod",
    initialRoute: AppRouter.SPLASH,
    child: MyApp.runWidget(),
  ));
}
