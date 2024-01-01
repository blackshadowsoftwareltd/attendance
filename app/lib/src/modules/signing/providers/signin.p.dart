import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/enums.dart';
import '../../users/models/users.dart';

part 'signin.p.g.dart';

@riverpod
class LoginState extends _$LoginState {
  @override
  LoginType build() => LoginType.signin;

  void toggle() {
    state = state == LoginType.signin ? LoginType.signup : LoginType.signin;
    ref.invalidate(authProvider);
  }
}

@riverpod
class Auth extends _$Auth {
  @override
  User build() => User();

  void setEmail(String e) {
    state.email = e;
    ref.notifyListeners();
  }

  void setPassword(String p) {
    state.password = p;
    ref.notifyListeners();
  }

  void setName(String n) {
    state.name = n;
    ref.notifyListeners();
  }

  void setId(int i) {
    state.id = i;
    ref.notifyListeners();
  }

  void set(User u) {
    state = u;
    ref.notifyListeners();
  }

  bool validateSignin() {
    return (state.email != null && state.email!.isNotEmpty == true) &&
        (state.password != null && state.password!.isNotEmpty == true);
  }

  bool validateSignup() {
    return state.name?.isNotEmpty == true && state.email?.isNotEmpty == true && state.password?.isNotEmpty == true;
  }
}
