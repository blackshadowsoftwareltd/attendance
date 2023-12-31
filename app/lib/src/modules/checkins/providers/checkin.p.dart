import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/constants.dart';
import '../models/checkin_details.dart';

part 'checkin.p.g.dart';

@riverpod
class Checkins extends _$Checkins {
  @override
  FutureOr<List<UserDetails>?> build() async {
    final request = Request('GET', Uri.parse('${baseUrl}get_all_checkins'));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      debugPrint(data);
      return Future.value(usersDetailsFromString(data));
    } else {
      debugPrint(response.reasonPhrase);
    }
    return Future.value([]);
  }
}
