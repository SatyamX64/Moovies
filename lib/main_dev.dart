import 'package:findseat/app_config.dart';
import 'package:findseat/presentation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(Provider(
    create: (_) => AppConfig(
      appName: "FindSeat Dev",
      flavorName: "dev",
      initialRoute: AppRouter.BOOK_SEAT_SLOT,
    ),
    child: MyApp(),
  ));
}
