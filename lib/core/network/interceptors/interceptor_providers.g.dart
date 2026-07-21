// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interceptor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loggerInterceptor)
final loggerInterceptorProvider = LoggerInterceptorProvider._();

final class LoggerInterceptorProvider
    extends
        $FunctionalProvider<
          LoggerInterceptor,
          LoggerInterceptor,
          LoggerInterceptor
        >
    with $Provider<LoggerInterceptor> {
  LoggerInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggerInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggerInterceptorHash();

  @$internal
  @override
  $ProviderElement<LoggerInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoggerInterceptor create(Ref ref) {
    return loggerInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoggerInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoggerInterceptor>(value),
    );
  }
}

String _$loggerInterceptorHash() => r'02b519c2b837109e0e663e1af4413810a0b7ad66';

@ProviderFor(errorInterceptor)
final errorInterceptorProvider = ErrorInterceptorProvider._();

final class ErrorInterceptorProvider
    extends
        $FunctionalProvider<
          ErrorInterceptor,
          ErrorInterceptor,
          ErrorInterceptor
        >
    with $Provider<ErrorInterceptor> {
  ErrorInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorInterceptorHash();

  @$internal
  @override
  $ProviderElement<ErrorInterceptor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ErrorInterceptor create(Ref ref) {
    return errorInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorInterceptor>(value),
    );
  }
}

String _$errorInterceptorHash() => r'03875d5f61b6ccfadfd300098fbdd25b6195d426';

@ProviderFor(authInterceptor)
final authInterceptorProvider = AuthInterceptorProvider._();

final class AuthInterceptorProvider
    extends
        $FunctionalProvider<AuthInterceptor, AuthInterceptor, AuthInterceptor>
    with $Provider<AuthInterceptor> {
  AuthInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authInterceptorHash();

  @$internal
  @override
  $ProviderElement<AuthInterceptor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthInterceptor create(Ref ref) {
    return authInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthInterceptor>(value),
    );
  }
}

String _$authInterceptorHash() => r'd76ec665af5e5ecece5c42f4e0bf86f2034919d5';
