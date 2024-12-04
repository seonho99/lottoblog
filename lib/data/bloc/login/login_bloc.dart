import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginInitialState()) {
    on<LoginWithEmail>(_onLoginWithEmail);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLoginWithEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final user = await _authRepository.signInWithEmail(
          event.email, event.password);

      if (user != null) {
        emit(LoginAuthenticatedState(user.uid)); // 인증된 상태로 상태 변경
      } else if (user == null) {
        emit(LoginErrorState('로그인 실패: 사용자 정보가 없습니다.'));
      } else {
        emit(LoginErrorState('이메일 인증이 필요합니다.'));
      }
    } catch (e) {
      emit(
          LoginErrorState('로그인 오류: ${e.toString()}'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      await _authRepository.signOut();
      emit(LoginUnAuthenticatedState());
    } catch (e) {
      emit(LoginErrorState('로그아웃 오류 :${e.toString()}'));
    }
  }
}