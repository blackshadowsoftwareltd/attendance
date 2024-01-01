// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin.p.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginStateHash() => r'5152b95ba97b9607294be6d81cb2e0662df6290c';

/// See also [LoginState].
@ProviderFor(LoginState)
final loginStateProvider =
    AutoDisposeNotifierProvider<LoginState, LoginType>.internal(
  LoginState.new,
  name: r'loginStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginState = AutoDisposeNotifier<LoginType>;
String _$authHash() => r'296f187c0017ae01db544d330e7b59729fedbbfd';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider = AutoDisposeNotifierProvider<Auth, User>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AutoDisposeNotifier<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
