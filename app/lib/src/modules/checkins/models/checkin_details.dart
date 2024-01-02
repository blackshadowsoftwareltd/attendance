import 'dart:convert';

import '../../users/models/users.dart';
import 'checkin.dart';
import 'checkout.dart';

class CheckinsDetailsModel {
  UserInfo? userInfo;
  Checkin? checkin;
  Checkout? checkout;

  CheckinsDetailsModel({
    this.userInfo,
    this.checkin,
    this.checkout,
  });

  CheckinsDetailsModel copyWith({
    UserInfo? userInfo,
    Checkin? checkin,
    Checkout? checkout,
  }) =>
      CheckinsDetailsModel(
        userInfo: userInfo ?? this.userInfo,
        checkin: checkin ?? this.checkin,
        checkout: checkout ?? this.checkout,
      );

  factory CheckinsDetailsModel.fromRawJson(String str) => CheckinsDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckinsDetailsModel.fromJson(Map<String, dynamic> json) => CheckinsDetailsModel(
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        checkin: json["checkin"] == null ? null : Checkin.fromJson(json["checkin"]),
        checkout: json["checkout"] == null ? null : Checkout.fromJson(json["checkout"]),
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
      };
}
