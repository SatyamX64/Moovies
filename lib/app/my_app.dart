import 'package:findseat/app_config.dart';
import 'package:findseat/model/repo/home_repository.dart';
import 'package:findseat/model/repo/user_repository.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/sc_home.dart';
import 'package:findseat/presentation/screen/login/barrel_login.dart';
import 'package:findseat/presentation/screen/splash/sc_splash.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../presentation/app_router.dart';
import 'auth_bloc/bloc.dart';
import 'bloc_observer.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    var initialRoute = AppConfig.of(context).initialRoute;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.DEFAULT,
        accentColor: COLOR_CONST.DEFAULT,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          } else if (state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated) {
            return HomeScreen();
          }

          return Container(
            child: Center(child: Text('Unhandle State $state')),
          );
        },
      ),
    );
  }

  static Future<void> initSystemDefault() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Stripe.publishableKey =
        "pk_test_51JJzrrSDQIEk13EuUivr4AoLAyRPWni3RP3KDr2PhQDXRIm2ob4dnpSF1UnkwKSRTEWBGx0Pkl4ELYhGGPFxSu1e00qNVGehYe";
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
    Bloc.observer = MyBlocObserver();
  }

  static Widget runWidget() {
    final userRepository = UserRepository();
    final homeRepository = HomeRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(value: userRepository),
        RepositoryProvider<HomeRepository>.value(value: homeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository)
                  ..add(AppStarted()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(homeRepository: homeRepository),
          ),
        ],
        child: MyApp(userRepository: userRepository),
      ),
    );
  }
}
