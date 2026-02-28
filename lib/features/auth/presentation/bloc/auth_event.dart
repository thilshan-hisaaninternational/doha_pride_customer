import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String identifier;
  final String password;

  const AuthLoginRequested({required this.identifier, required this.password});

  @override
  List<Object?> get props => [identifier, password];
}

class AuthRegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String password;

  const AuthRegisterRequested({
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, username, phone, password];
}
