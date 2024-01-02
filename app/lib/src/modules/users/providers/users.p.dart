import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:app/src/modules/users/models/users.dart';
import 'package:app/src/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.p.g.dart';

@riverpod
class Users extends _$Users {
  @override
  FutureOr<List<UserInfo>?> build() async {
    final request = Request('GET', Uri.parse('${baseUrl}users'));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      debugPrint(data);
      return Future.value(getUserInfoListFromString(data));
    } else {
      debugPrint(response.reasonPhrase);
    }

    return Future.value([]);
  }
}
