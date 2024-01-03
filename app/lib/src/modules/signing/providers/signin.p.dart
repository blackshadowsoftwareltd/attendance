import 'dart:convert';
import 'package:app/src/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/enums.dart';
import '../../home/models/error.dart';
import '../../users/models/users.dart';
import '../../users/providers/users.p.dart';

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
  UserInfo build() => UserInfo();

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
    state.userId = i;
    ref.notifyListeners();
  }

  void set(UserInfo u) {
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

  Future<String?> signup() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = Request('POST', Uri.parse('${baseUrl}add_user'));
      request.body = json.encode({"name": state.name, "email": state.email, "password": state.password});
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      final data = await response.stream.bytesToString();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final user = UserInfo.fromRawJson(data);
        ref.read(currentUserProvider.notifier).set(user);
        return null;
      } else {
        debugPrint(response.reasonPhrase);
        return response.reasonPhrase;
      }
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  Future<String?> signin() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = Request('POST', Uri.parse('${baseUrl}signin'));
      request.body = json.encode({"email": state.email, "password": state.password});
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final user = UserInfo.fromRawJson(data);
        ref.read(currentUserProvider.notifier).set(user);
        return null;
      } else if (response.statusCode == 400) {
        return ApiError.fromRawJson(data).reason?.fold('Failed : ', (p, e) => '$p $e');
      }
      return response.reasonPhrase;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }
}
