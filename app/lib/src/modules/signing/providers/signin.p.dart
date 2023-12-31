import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/enums.dart';

part 'signin.p.g.dart';

@riverpod
class LoginState extends _$LoginState {
  @override
  LoginType build() => LoginType.signin;

  void toggle() {
    state = state == LoginType.signin ? LoginType.signup : LoginType.signin;
  }
}
