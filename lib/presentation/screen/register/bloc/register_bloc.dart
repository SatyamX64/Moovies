import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:findseat/model/repo/user_repository.dart';
import 'package:findseat/utils/validators.dart';

import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState.empty());

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
      Stream<RegisterEvent> events,
      Stream<Transition<RegisterEvent, RegisterState>> Function(RegisterEvent)
          next) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged &&
          event is! PasswordChanged &&
          event is! NameChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged ||
          event is PasswordChanged ||
          event is NameChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(
          event.email, event.password, event.displayName);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: Validators.isValidName(name),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String email, String password, String displayName) async* {
    yield RegisterState.loading();

    try {
      await _userRepository.signUp(
          email: email, password: password, displayName: displayName);
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
