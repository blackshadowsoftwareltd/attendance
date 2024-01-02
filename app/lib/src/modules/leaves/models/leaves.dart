import 'dart:convert';

class Leave {
  int? userId;
  int? leaveId;
  DateTime? leaveTime;
  String? leaveReason;

  Leave({
    this.userId,
    this.leaveId,
    this.leaveTime,
    this.leaveReason,
  });

  Leave copyWith({
    int? userId,
    int? leaveId,
    DateTime? leaveTime,
    String? leaveReason,
  }) =>
      Leave(
        userId: userId ?? this.userId,
        leaveId: leaveId ?? this.leaveId,
        leaveTime: leaveTime ?? this.leaveTime,
        leaveReason: leaveReason ?? this.leaveReason,
      );

  factory Leave.fromRawJson(String str) => Leave.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        userId: json["user_id"],
        leaveId: json["leave_id"],
        leaveTime: json["leave_time"] == null ? null : DateTime.parse(json["leave_time"]),
        leaveReason: json["leave_reason"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "leave_id": leaveId,
        "leave_time": leaveTime?.toIso8601String(),
        "leave_reason": leaveReason,
      };
}
