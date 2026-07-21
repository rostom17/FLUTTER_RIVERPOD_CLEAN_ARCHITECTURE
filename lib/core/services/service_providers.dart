import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'secure_storage.dart';
import 'token_service.dart';

part 'service_providers.g.dart';

// secure_storage provider
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => SecureStorage.secureStorage;

// token_service provider
@Riverpod(keepAlive: true)
TokenService tokenService(Ref ref) =>
    TokenServiceImpl(ref.read(secureStorageProvider));
