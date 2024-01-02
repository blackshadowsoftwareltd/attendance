import 'dart:convert';

class Checkout {
  int? checkInId;
  int? checkOutId;
  DateTime? checkOutTime;

  Checkout({
    this.checkInId,
    this.checkOutId,
    this.checkOutTime,
  });

  Checkout copyWith({
    int? checkInId,
    int? checkOutId,
    DateTime? checkOutTime,
  }) =>
      Checkout(
        checkInId: checkInId ?? this.checkInId,
        checkOutId: checkOutId ?? this.checkOutId,
        checkOutTime: checkOutTime ?? this.checkOutTime,
      );

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
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
