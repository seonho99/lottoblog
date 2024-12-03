import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;

  SignUpBloc(this._authRepository) : super(SignUpInitial()) {
    on<SignUpWithEmail>(_onSignUpWithEmail);
  }

  Future<void> _onSignUpWithEmail(SignUpWithEmail event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      await _authRepository.signUpWithEmail(event.email, event.password, event.name);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
