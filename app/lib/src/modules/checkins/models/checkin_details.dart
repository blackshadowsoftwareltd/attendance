import 'dart:convert';

import 'package:app/src/modules/leaves/models/leaves.dart';

import '../../breaks/models/breaks.dart';
import '../../users/models/users.dart';
import 'checkin.dart';
import 'checkout.dart';

List<UserDetails> usersDetailsFromString(String str) =>
    List<UserDetails>.from(json.decode(str).map((x) => UserDetails.fromJson(x)));

class UserDetails {
  UserInfo? userInfo;
  CheckinDetails? checkin;
  CheckoutDetails? checkout;
  BreakDetails? breaks;
  LeaveDetails? leave;

  UserDetails({
    this.userInfo,
    this.checkin,
    this.checkout,
    this.breaks,
    this.leave,
  });

  UserDetails copyWith({
    UserInfo? userInfo,
    CheckinDetails? checkin,
    CheckoutDetails? checkout,
    BreakDetails? breaks,
    LeaveDetails? leave,
  }) =>
      UserDetails(
        userInfo: userInfo ?? this.userInfo,
        checkin: checkin ?? this.checkin,
        checkout: checkout ?? this.checkout,
        breaks: breaks ?? this.breaks,
        leave: leave ?? this.leave,
      );

  factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        checkin: json["checkin"] == null ? null : CheckinDetails.fromJson(json["checkin"]),
        checkout: json["checkout"] == null ? null : CheckoutDetails.fromJson(json["checkout"]),
        breaks: json["breaks"] == null ? null : BreakDetails.fromJson(json["breaks"]),
        leave: json["leave"] == null ? null : LeaveDetails.fromJson(json["leave"]),
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
        "breaks": breaks?.toJson(),
        "leave": leave?.toJson(),
      }..removeWhere((_, v) => v == null);
}
