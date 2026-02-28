import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:doha_pride_customer/core/errors/failures.dart';
import 'package:doha_pride_customer/core/usecases/usecase.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_result.dart';
import 'package:doha_pride_customer/features/auth/domain/repositories/auth_repository.dart';

class Login extends UseCase<AuthResult, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(LoginParams params) {
    return repository.login(
      identifier: params.identifier,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String identifier;
  final String password;

  const LoginParams({required this.identifier, required this.password});

  @override
  List<Object?> get props => [identifier, password];
}
