import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'profile.m.g.dart';
part 'profile.m.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? fullName,
    String? id,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
