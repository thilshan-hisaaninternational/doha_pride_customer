import 'package:equatable/equatable.dart';
import 'auth_user.dart';
import 'auth_tokens.dart';

class AuthResult extends Equatable {
  final AuthUser user;
  final AuthTokens tokens;

  const AuthResult({required this.user, required this.tokens});

  @override
  List<Object?> get props => [user, tokens];
}
