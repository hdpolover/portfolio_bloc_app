import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portofolio_bloc_app/features/auth/domain/usecases/sign_in_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase signInUsecase;

  AuthBloc({required this.signInUsecase}) : super(AuthInitial()) {
    on<LoginAuthEvent>(_onLogin);
    on<LogoutAuthEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      final result = await signInUsecase(
        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (failure) {
          emit(AuthError(message: failure.message));
        },
        (adminUser) {
          emit(AuthAuthenticated(email: adminUser.email));
        },
      );
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogout(LogoutAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    emit(AuthUnauthenticated());
  }
}
