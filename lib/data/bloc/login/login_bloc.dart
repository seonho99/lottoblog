import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginUnAuthenticated()) {
    on<LoginWithEmail>((event, emit) async {
      try {
        User? user = await _authRepository.signInWithEmail(
            email: event.email,
            password: event.password);

        if (user != null) {
          emit(LoginAuthenticated(user));
        } else {
          emit(LoginErrorState('Login failed'));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }

}