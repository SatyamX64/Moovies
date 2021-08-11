import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent', event!);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
    log('onError', error);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(
        'onTransition',
        '\tcurrentState=${transition.currentState}\n'
            '\tnextState=${transition.nextState}');
  }

  void log(String name, Object msg) {
    print(
        '===== ${DateFormat("HH:mm:ss-dd MMM, yyyy").format(DateTime.now())}: $name\n'
        '$msg');
  }
}
