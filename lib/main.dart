import 'package:flutter/services.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'presentation/app_router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: COLOR_CONST.STATUS_BAR,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = "pk_test_51JJzrrSDQIEk13EuUivr4AoLAyRPWni3RP3KDr2PhQDXRIm2ob4dnpSF1UnkwKSRTEWBGx0Pkl4ELYhGGPFxSu1e00qNVGehYe";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.BOOK_SEAT_SLOT,
    );
  }
}
