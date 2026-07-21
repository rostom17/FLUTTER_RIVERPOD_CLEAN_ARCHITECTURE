import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/core/constants/app_secrets.dart';
import '/core/errors/exception.dart';

abstract interface class TokenService {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRefreshToken(String refreshToken);
  Future<void> deleteAllTokens();
}

class TokenStorageServiceImpl implements TokenService {
  final FlutterSecureStorage _storage;

  TokenStorageServiceImpl(this._storage);

  @override
  Future<String?> getAccessToken() async =>
      await _read(AppSecrets.accessTokenKey);

  @override
  Future<String?> getRefreshToken() async =>
      await _read(AppSecrets.refreshTokenKey);

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _write(AppSecrets.accessTokenKey, accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await _write(AppSecrets.refreshTokenKey, refreshToken);
  }

  @override
  Future<void> deleteAllTokens() async {
    try {
      await Future.wait([
        _storage.delete(key: AppSecrets.accessTokenKey),
        _storage.delete(key: AppSecrets.refreshTokenKey),
      ]);
    } catch (e) {
      throw StorageException();
    }
  }

  Future<String?> _read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw StorageException();
    }
  }

  Future<void> _write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw StorageException();
    }
  }
}
