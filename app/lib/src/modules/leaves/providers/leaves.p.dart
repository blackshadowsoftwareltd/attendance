import 'dart:async';

import 'package:app/src/modules/checkins/models/checkin_details.dart';
import 'package:app/src/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaves.p.g.dart';

@riverpod
class Leaves extends _$Leaves {
  @override
  FutureOr<List<UserDetails>?> build() async {
    final request = Request('GET', Uri.parse('${baseUrl}get_all_leaves'));

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
