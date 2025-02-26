import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginUnAuthenticated()) {
    on<SignUpEmail>((event, emit) async {
      try {
        await _authRepository.signUpWithEmail(
          email: event.email,
          password: event.password,
          name: event.name,
        );
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LoginWithEmail>((event, emit) async {
      try {
        User? user = await _authRepository.signInWithEmail(
          email: event.email,
          password: event.password,
        );
        if (user != null) {
          emit(LoginAuthenticated(user));
        } else {
          emit(LoginFailure("User not found"));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authRepository.signOut();
      } catch (e) {
        emit(LoginUnAuthenticated());
      }
    });
  }
}
