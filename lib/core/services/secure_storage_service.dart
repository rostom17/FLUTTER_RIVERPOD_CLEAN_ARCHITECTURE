import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  const SecureStorageService._();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(),
  );

  static FlutterSecureStorage get secureStorage => _storage;
}
