import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'email_reset_password_event.dart';
import 'email_reset_password_state.dart';

class EmailResetPasswordBloc extends Bloc<EmailResetPasswordEvent, EmailResetPasswordState> {
  final AuthRepository _authRepository;


  EmailResetPasswordBloc(this._authRepository) : super(EmailResetPasswordInital()){
    on<ResetPasswordEmail>(_onResetPasswordEmail);
  }

  Future<void> _onResetPasswordEmail(ResetPasswordEmail event, Emitter<EmailResetPasswordState> emit) async {
    emit(EmailResetPasswordLoading());

    try {
      await _authRepository.resetPassword(event.email);
      emit(EmailResetPasswordSuccess('비밀번호 재설정 이메일이 전송되었습니다.'));
    } catch (e) {
      emit(EmailResetPasswordError(e.toString()));
    }
  }
}