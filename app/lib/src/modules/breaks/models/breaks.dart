import 'dart:convert';

class BreakDetails {
  int? userId;
  int? breakId;
  String? breakReason;
  DateTime? startAt;
  DateTime? endAt;

  BreakDetails({
    this.userId,
    this.breakId,
    this.breakReason,
    this.startAt,
    this.endAt,
  });

  BreakDetails copyWith({
    int? userId,
    int? breakId,
    String? breakReason,
    DateTime? startAt,
    DateTime? endAt,
  }) =>
      BreakDetails(
        userId: userId ?? this.userId,
        breakId: breakId ?? this.breakId,
        breakReason: breakReason ?? this.breakReason,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
      );

  factory BreakDetails.fromRawJson(String str) => BreakDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreakDetails.fromJson(Map<String, dynamic> json) => BreakDetails(
        userId: json["user_id"],
        breakId: json["break_id"],
        breakReason: json["break_reason"],
        startAt: json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "break_id": breakId,
        "break_reason": breakReason,
        "start_at": startAt?.toIso8601String(),
        "end_at": endAt?.toIso8601String(),
      };
}
