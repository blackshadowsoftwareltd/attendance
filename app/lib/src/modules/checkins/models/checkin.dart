import 'dart:convert';

class CheckinDetails {
  int? userId;
  int? checkInId;
  DateTime? checkInTime;

  CheckinDetails({
    this.userId,
    this.checkInId,
    this.checkInTime,
  });

  CheckinDetails copyWith({
    int? userId,
    int? checkInId,
    DateTime? checkInTime,
  }) =>
      CheckinDetails(
        userId: userId ?? this.userId,
        checkInId: checkInId ?? this.checkInId,
        checkInTime: checkInTime ?? this.checkInTime,
      );

  factory CheckinDetails.fromRawJson(String str) => CheckinDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckinDetails.fromJson(Map<String, dynamic> json) => CheckinDetails(
        userId: json["user_id"],
        checkInId: json["check_in_id"],
        checkInTime: json["check_in_time"] == null ? null : DateTime.parse(json["check_in_time"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "check_in_id": checkInId,
        "check_in_time": checkInTime?.toIso8601String(),
      };
}
