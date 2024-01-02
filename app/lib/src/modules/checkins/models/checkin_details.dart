import 'dart:convert';

import '../../users/models/users.dart';
import 'checkin.dart';
import 'checkout.dart';

List<CheckinsDetailsModel> checkinsDetailsModelFromJson(String str) =>
    List<CheckinsDetailsModel>.from(json.decode(str).map((x) => CheckinsDetailsModel.fromJson(x)));

class CheckinsDetailsModel {
  UserInfo? userInfo;
  CheckinDetails? checkin;
  CheckoutDetails? checkout;

  CheckinsDetailsModel({
    this.userInfo,
    this.checkin,
    this.checkout,
  });

  CheckinsDetailsModel copyWith({
    UserInfo? userInfo,
    CheckinDetails? checkin,
    CheckoutDetails? checkout,
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
        checkin: json["checkin"] == null ? null : CheckinDetails.fromJson(json["checkin"]),
        checkout: json["checkout"] == null ? null : CheckoutDetails.fromJson(json["checkout"]),
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo?.toJson(),
        "checkin": checkin?.toJson(),
        "checkout": checkout?.toJson(),
      };
}
