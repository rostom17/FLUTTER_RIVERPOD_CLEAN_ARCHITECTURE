// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_checker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectivity)
final connectivityProvider = ConnectivityProvider._();

final class ConnectivityProvider
    extends $FunctionalProvider<Connectivity, Connectivity, Connectivity>
    with $Provider<Connectivity> {
  ConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityHash();

  @$internal
  @override
  $ProviderElement<Connectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Connectivity create(Ref ref) {
    return connectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Connectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Connectivity>(value),
    );
  }
}

String _$connectivityHash() => r'e66720f09edf1a8b09e450e1eaedd51da9443f0e';

@ProviderFor(connectivityChecker)
final connectivityCheckerProvider = ConnectivityCheckerProvider._();

final class ConnectivityCheckerProvider
    extends
        $FunctionalProvider<
          ConnectivityChecker,
          ConnectivityChecker,
          ConnectivityChecker
        >
    with $Provider<ConnectivityChecker> {
  ConnectivityCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityCheckerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityCheckerHash();

  @$internal
  @override
  $ProviderElement<ConnectivityChecker> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityChecker create(Ref ref) {
    return connectivityChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityChecker>(value),
    );
  }
}

String _$connectivityCheckerHash() =>
    r'1d7ac7c24632a34678c82807eb619c341efd3383';
