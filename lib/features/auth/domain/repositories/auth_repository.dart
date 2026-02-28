import 'package:fpdart/fpdart.dart';
import 'package:doha_pride_customer/core/errors/failures.dart';
import '../entities/auth_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> register({
    required String name,
    required String email,
    required String username,
    required String phone,
    required String password,
  });

  Future<Either<Failure, AuthResult>> login({
    required String identifier,
    required String password,
  });
}
