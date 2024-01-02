import 'dart:convert';

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

  UserDetails({
    this.userInfo,
    this.checkin,
    this.checkout,
    this.breaks,
  });

  UserDetails copyWith({
    UserInfo? userInfo,
    CheckinDetails? checkin,
    CheckoutDetails? checkout,
    BreakDetails? breaks,
  }) =>
      UserDetails(
        userInfo: userInfo ?? this.userInfo,
        checkin: checkin ?? this.checkin,
        checkout: checkout ?? this.checkout,
        breaks: breaks ?? this.breaks,
      );

  factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        checkin: json["checkin"] == null ? null : CheckinDetails.fromJson(json["checkin"]),
        checkout: json["checkout"] == null ? null : CheckoutDetails.fromJson(json["checkout"]),
        breaks: json["breaks"] == null ? null : BreakDetails.fromJson(json["breaks"]),
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
        "breaks": breaks?.toJson(),
      }..removeWhere((_, v) => v == null);
}
