import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doha_pride_customer/features/auth/domain/usecases/login.dart';
import 'package:doha_pride_customer/features/auth/domain/usecases/register.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login _login;
  final Register _register;

  AuthBloc({required Login login, required Register register})
    : _login = login,
      _register = register,
      super(AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await _login(
      LoginParams(identifier: event.identifier, password: event.password),
    );

    result.match(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (authResult) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          result: authResult,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

    final result = await _register(
      RegisterParams(
        name: event.name,
        email: event.email,
        username: event.username,
        phone: event.phone,
        password: event.password,
      ),
    );

    result.match(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (authResult) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          result: authResult,
          errorMessage: null,
        ),
      ),
    );
  }
}
