import 'package:findseat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:flutter/material.dart';
import 'screen/all_shows/sc_all_shows.dart';
import 'screen/booking/barrel_booking.dart';
import 'screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'screen/booking/book_seat_type/barrel_book_seat_type.dart';
import 'screen/home/sc_home.dart';
import 'screen/login/sc_login.dart';
import 'screen/show_info/sc_show_info.dart';
import 'screen/splash/sc_splash.dart';

class AppRouter {
  static const String HOME = '/';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String ALL_SHOWS = '/all_shows';
  static const String SHOW_INFO = '/show_info';
  static const String BOOK_TIME_SLOT = '/book_time_slot';
  static const String BOOK_SEAT_TYPE = '/book_seat_type';
  static const String BOOK_SEAT_SLOT = '/book_seat_slot';
  static const String LIST_ALL_CINE = '/list_all_cine';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case ALL_SHOWS:
        return MaterialPageRoute(builder: (_) => AllShowsScreen());
      case SHOW_INFO:
        return MaterialPageRoute(builder: (_) => ShowInfoScreen());
      case BOOK_TIME_SLOT:
        return MaterialPageRoute(builder: (_) => BookTimeSlotScreen());
      case BOOK_SEAT_TYPE:
        return MaterialPageRoute(builder: (_) => BookSeatTypeScreen());
      case BOOK_SEAT_SLOT:
        return MaterialPageRoute(builder: (_) => BookSeatSlotScreen());
      case LIST_ALL_CINE:
        return MaterialPageRoute(builder: (_) => ListAllCineScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
