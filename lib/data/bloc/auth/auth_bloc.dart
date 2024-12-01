import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitialState()) {

    on<AppStarted>((event, emit) async{
      await _mapAppStartedToState(emit);
    });

    on<SignInWithEmail>((event, emit) async {
      await _mapSignInWithEmailToState(event, emit);
    });

    on<SignOut>((event, emit) async {
      await _mapSignOutToState(emit);
    });
  }

  // 시작 시
  Future<void> _mapAppStartedToState(Emitter<AuthState> emit) async {
    if (_authRepository.isLoggedIn()){
      emit(AuthAuthenticatedState(_authRepository.currentUserId));
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> _mapSignInWithEmailToState(SignInWithEmail event, Emitter<AuthState> emit) async {
    try {
      emit(AuthInitialState());
      final user = await _authRepository.signInWithEmail(event.email, event.password);
      emit(AuthAuthenticatedState(user!));
    } catch (e) {
      emit(AuthErrorState('로그인 실패: $e'));
    }
  }

  Future<void> _mapSignOutToState(Emitter<AuthState> emit) async {
    try {
      emit(AuthInitialState());
      await _authRepository.signOut();
      emit(AuthUnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState('로그아웃 실패: $e'));
    }
  }
}
