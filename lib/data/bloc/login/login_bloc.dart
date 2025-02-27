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
        User? user = _authRepository.user;
        if(user!= null){
          emit(LoginAuthenticated(user));
        } else {
          emit(LoginFailure('회원가입 실패'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LoginWithEmail>((event, emit) async {
      try {
        await _authRepository.signInWithEmail(
          email: event.email,
          password: event.password,
        );
        User? user = _authRepository.user;
        if (user != null) {
          emit(LoginAuthenticated(user));
        } else {
          emit(LoginFailure('로그인 실패'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<SignOut>((event, emit) async {
      try {
        await _authRepository.signOut();
        User? user = _authRepository.user;
        // print('state: $user');
        if(user == null){
          emit(LoginUnAuthenticated());
        } else {
          emit(LoginFailure('로그인 실패'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<DeleteAccount>((event, emit) async {
      try {
        await _authRepository.deleteAccount();
        User? user = _authRepository.user;
        if(user == null){
          emit(LoginUnAuthenticated());
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<ResetPassword>((event, emit) async {
      try {
        await _authRepository.resetPassword(email: event.email);
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
