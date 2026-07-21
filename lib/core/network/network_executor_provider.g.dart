// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_executor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkExecutor)
final networkExecutorProvider = NetworkExecutorProvider._();

final class NetworkExecutorProvider
    extends
        $FunctionalProvider<NetworkExecutor, NetworkExecutor, NetworkExecutor>
    with $Provider<NetworkExecutor> {
  NetworkExecutorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkExecutorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkExecutorHash();

  @$internal
  @override
  $ProviderElement<NetworkExecutor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkExecutor create(Ref ref) {
    return networkExecutor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkExecutor>(value),
    );
  }
}

String _$networkExecutorHash() => r'7b9a6b4b4cf91492f0934651523384ccfe069d05';
