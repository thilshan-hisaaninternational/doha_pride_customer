import 'package:equatable/equatable.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_result.dart';

enum AuthStatus { initial, loading, authenticated, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthResult? result;
  final String? errorMessage;

  const AuthState({required this.status, this.result, this.errorMessage});

  factory AuthState.initial() {
    return const AuthState(status: AuthStatus.initial);
  }

  AuthState copyWith({
    AuthStatus? status,
    AuthResult? result,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, result, errorMessage];
}
