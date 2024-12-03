import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'signin_event.dart';
import 'signin_state.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc(this._authRepository) : super(SignInInitialState()) {
    on<SignInWithEmail>(_onSignInWithEmail);
  }

  Future<void> _onSignInWithEmail(SignInWithEmail event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    try {
      final user = await _authRepository.signInWithEmail(event.email, event.password);

      if (user != null) {
        emit(SignInAuthenticatedState(user.uid));  // 인증된 상태로 상태 변경
      } else {
        emit(SignInErrorState('로그인 실패: 사용자 정보 없음'));  // 사용자 정보가 없을 경우 에러 상태로 변경
      }
    } catch (e) {
      emit(SignInErrorState('로그인 오류: ${e.toString()}'));  // 예외 메시지를 포함하여 에러 상태로 변경
    }
  }
}
