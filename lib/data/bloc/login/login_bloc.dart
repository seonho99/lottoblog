import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  String? getUid() {
    return _authRepository.getUid();
  }

  LoginBloc(this._authRepository) : super(LoginUnAuthenticated()) {
    on<SignUpEmail>((event, emit) async {
      try {
        User? user = await _authRepository.signUpWithEmail(
            email: event.email, password: event.password);
        if (user != null) {
          emit(LoginAuthenticated(user)); // Pass the User object
        }
      } catch (e) {
        emit(LoginError(e.toString()));
        emit(LoginUnAuthenticated());
      }
    });

    on<LoginWithEmail>((event, emit) async {
      try {
        User? user = await _authRepository.signInWithEmail(
            email: event.email, password: event.password);
        if (user != null) {
          emit(LoginAuthenticated(user)); // Pass the User object
        }
      } catch (e) {
        emit(LoginError(e.toString()));
        emit(LoginUnAuthenticated());
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authRepository.signOut();
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
