import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String username;
  final String phone;

  const AuthUser({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
  });

  @override
  List<Object?> get props => [id, name, email, username, phone];
}
