import 'dart:convert';

import 'package:app/src/modules/checkins/models/checkout.dart';
import 'package:app/src/modules/users/providers/users.p.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/constants.dart';
import '../../checkins/models/checkin.dart';

part 'provider.p.g.dart';

@riverpod
class CurrentChckins extends _$CurrentChckins {
  @override
  CheckinDetails? build() => null;

  Future<String?> checkin() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return 'Please login first';

    final time = ref.read(chckinsTimeProvider);
    if (time == null) return 'Please select a time';

    final request = Request('POST', Uri.parse('${baseUrl}checkin_checkout'));
    var headers = {'Content-Type': 'application/json'};
    request.body = json.encode({"user_id": user.userId, "check_in_time": time.toIso8601String()});
    request.headers.addAll(headers);
    StreamedResponse response = await request.send();

    final data = await response.stream.bytesToString();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      ref.invalidate(chckinsTimeProvider);
      ref.invalidate(currentChckoutsProvider);
      debugPrint(data);
      state = CheckinDetails.fromRawJson(data);
      return null;
    } else {
      state = null;
      debugPrint(response.reasonPhrase);
      return response.reasonPhrase;
    }
  }
}

@riverpod
class CurrentChckouts extends _$CurrentChckouts {
  @override
  CheckoutDetails? build() => null;

  Future<String?> checkout() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return 'Please login first';

    final checkin = ref.read(currentChckinsProvider);
    if (checkin == null) return 'You have not checked in yet';

    final time = ref.read(chckoutTimeProvider);
    if (time == null) return 'Please select a time';

    final request = Request('POST', Uri.parse('${baseUrl}checkin_checkout'));
    var headers = {'Content-Type': 'application/json'};
    request.body = json.encode({"check_in_id": checkin?.checkInId, "check_out_time": time.toIso8601String()});
    request.headers.addAll(headers);
    StreamedResponse response = await request.send();
    final data = await response.stream.bytesToString();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      ref.invalidate(chckoutTimeProvider);
      debugPrint(data);
      state = CheckoutDetails.fromRawJson(data);
      ref.invalidate(currentChckinsProvider);
      return null;
    } else {
      state = null;
      debugPrint(response.reasonPhrase);
      return response.reasonPhrase;
    }
  }
}

@riverpod
class ChckinsTime extends _$ChckinsTime {
  @override
  DateTime? build() => null;

  Future<String?> pick(BuildContext c) async {
    final now = DateTime.now();
    final init = state == null ? TimeOfDay.now() : TimeOfDay(hour: state!.hour, minute: state!.minute);
    final time = await showTimePicker(context: c, initialTime: init);
    if (time == null) return 'Please select a time';
    state = now.copyWith(hour: time.hour, minute: time.minute);
    return null;
  }
}

@riverpod
class ChckoutTime extends _$ChckoutTime {
  @override
  DateTime? build() => null;

  Future<String?> pick(BuildContext c) async {
    final now = DateTime.now();
    final init = state == null ? TimeOfDay.now() : TimeOfDay(hour: state!.hour, minute: state!.minute);
    final time = await showTimePicker(context: c, initialTime: init);
    if (time == null) return 'Please select a time';
    state = now.copyWith(hour: time.hour, minute: time.minute);
    return null;
  }
}
