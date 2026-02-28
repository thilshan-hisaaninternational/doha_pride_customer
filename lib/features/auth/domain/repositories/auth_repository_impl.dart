import 'package:doha_pride_customer/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';
import 'package:doha_pride_customer/core/errors/failures.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_result.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_user.dart';
import 'package:doha_pride_customer/features/auth/domain/entities/auth_tokens.dart';
import 'package:doha_pride_customer/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  @override
  Future<Either<Failure, AuthResult>> register({
    required String name,
    required String email,
    required String username,
    required String phone,
    required String password,
  }) async {
    try {
      final json = await _remote.register(
        name: name,
        email: email,
        username: username,
        phone: phone,
        password: password,
      );

      final result = _mapAuthJson(json);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final json = await _remote.login(
        identifier: identifier,
        password: password,
      );

      final result = _mapAuthJson(json);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// TODO: Adjust this once we know your exact API response shape.
  AuthResult _mapAuthJson(Map<String, dynamic> json) {
    // Example assumptions — update based on real JSON:
    // {
    //   "data": {
    //     "user": { "id": "...", "name": "...", "email": "...", ... },
    //     "access_token": "...",
    //     "refresh_token": "..."
    //   }
    // }

    final data = (json['data'] ?? json) as Map<String, dynamic>;

    final userJson = (data['user'] ?? {}) as Map<String, dynamic>;

    final user = AuthUser(
      id: userJson['id']?.toString() ?? '',
      name: userJson['name'] as String? ?? '',
      email: userJson['email'] as String? ?? '',
      username: userJson['username'] as String? ?? '',
      phone: userJson['phone'] as String? ?? '',
    );

    final tokens = AuthTokens(
      accessToken: data['access_token'] as String? ?? '',
      refreshToken: data['refresh_token'] as String?,
    );

    return AuthResult(user: user, tokens: tokens);
  }
}
