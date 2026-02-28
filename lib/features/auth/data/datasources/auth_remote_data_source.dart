import 'package:dio/dio.dart';
import 'package:doha_pride_customer/core/network/api_client.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({Dio? dio}) : _dio = dio ?? ApiClient().dio;

  final Dio _dio;

  /// POST /auth/register
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String username,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'username': username,
          'phone': phone,
          'password': password,
        },
      );

      // Adjust this based on actual backend response structure
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      // Here you can inspect e.response?.data to extract backend error messages
      throw Exception(_mapDioError(e));
    } catch (e) {
      throw Exception('Unexpected error during register: $e');
    }
  }

  /// POST /auth/login
  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'identifier': identifier, 'password': password},
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(_mapDioError(e));
    } catch (e) {
      throw Exception('Unexpected error during login: $e');
    }
  }

  String _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    }

    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    // Try to extract a message from backend, otherwise fallback
    final backendMessage = _extractBackendMessage(data);

    if (statusCode == 400 || statusCode == 422) {
      return backendMessage ?? 'Invalid data. Please check your input.';
    } else if (statusCode == 401) {
      return backendMessage ?? 'Invalid credentials.';
    } else if (statusCode == 500) {
      return 'Server error. Please try again later.';
    }

    return backendMessage ?? 'Something went wrong. Please try again.';
  }

  String? _extractBackendMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data['message'] is String) return data['message'] as String;
      if (data['error'] is String) return data['error'] as String;
    }
    return null;
  }
}
