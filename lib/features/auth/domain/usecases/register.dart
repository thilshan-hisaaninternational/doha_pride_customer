import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:doha_pride_customer/core/errors/failures.dart';
import 'package:doha_pride_customer/core/usecases/usecase.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_result.dart';
import 'package:doha_pride_customer/features/auth/domain/repositories/auth_repository.dart';

class Register extends UseCase<AuthResult, RegisterParams> {
  final AuthRepository repository;

  Register(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(RegisterParams params) {
    return repository.register(
      name: params.name,
      email: params.email,
      username: params.username,
      phone: params.phone,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, username, phone, password];
}
