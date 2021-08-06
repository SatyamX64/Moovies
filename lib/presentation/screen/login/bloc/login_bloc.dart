import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:findseat/model/repo/user_repository.dart';
import 'package:findseat/presentation/screen/login/bloc/bloc.dart';
import 'package:findseat/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(LoginState.empty());
  @override
  Stream<Transition<LoginEvent,LoginState>> transformEvents(
      Stream<LoginEvent> events, Stream<Transition<LoginEvent, LoginState>> Function(LoginEvent) next) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEmailChanged && event is! LoginPasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is LoginEmailChanged || event is LoginPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitEmailPasswordEvent) {
      yield* _mapLoginSubmitEmailPasswordEventToState(
          event.email, event.password);
    } else if (event is LoginEmailChanged) {
      yield* _mapLoginEmailChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event.password);
    }
  }

  Stream<LoginState> _mapLoginSubmitEmailPasswordEventToState(
      String email, String password) async* {
    try {
      yield LoginState.loading();

      await _userRepository.signInWithCredentials(email : email,password :  password);
      final isSignedIn = await _userRepository.isSignedIn();

      if (isSignedIn) {
        yield LoginState.success();
      } else {
        yield LoginState.failure();
      }
    } catch (e) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }
}
