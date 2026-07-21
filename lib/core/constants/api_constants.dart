abstract class ApiConstants {
  const ApiConstants._();

  // Base URL
  static const baseUrl = 'https://dummyjson.com';

  // Timeouts
  static const connectionTimeout = Duration(seconds: 5);
  static const receiveTimeout = Duration(seconds: 5);
  static const sendTimeout = Duration(seconds: 5);

  // Headers
  static const contentTypeHeader = 'Content-Type';
  static const authorizationHeader = 'Authorization';
  static const acceptHeader = 'accept';
  static const json = 'application/json';
  static const bearer = 'Bearer';

  // Endpoints
  static const login = '/auth/login';
  static const signup = '/auth/sign-up';
  static const refresh = '/auth/refresh';
  static const currentUser = '/auth/me';

  static const products = '/products';
}
