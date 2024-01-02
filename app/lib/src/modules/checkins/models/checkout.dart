import 'dart:convert';

class CheckoutDetails {
  int? checkInId;
  int? checkOutId;
  DateTime? checkOutTime;

  CheckoutDetails({
    this.checkInId,
    this.checkOutId,
    this.checkOutTime,
  });

  CheckoutDetails copyWith({
    int? checkInId,
    int? checkOutId,
    DateTime? checkOutTime,
  }) =>
      CheckoutDetails(
        checkInId: checkInId ?? this.checkInId,
        checkOutId: checkOutId ?? this.checkOutId,
        checkOutTime: checkOutTime ?? this.checkOutTime,
      );

  factory CheckoutDetails.fromRawJson(String str) => CheckoutDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutDetails.fromJson(Map<String, dynamic> json) => CheckoutDetails(
        checkInId: json["check_in_id"],
        checkOutId: json["check_out_id"],
        checkOutTime: json["check_out_time"] == null ? null : DateTime.parse(json["check_out_time"]),
      );

  Map<String, dynamic> toJson() => {
        "check_in_id": checkInId,
        "check_out_id": checkOutId,
        "check_out_time": checkOutTime?.toIso8601String(),
      };
}
