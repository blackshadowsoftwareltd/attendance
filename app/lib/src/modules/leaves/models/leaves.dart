import 'dart:convert';

class LeaveDetails {
  int? userId;
  int? leaveId;
  DateTime? leaveTime;
  String? leaveReason;

  LeaveDetails({
    this.userId,
    this.leaveId,
    this.leaveTime,
    this.leaveReason,
  });

  LeaveDetails copyWith({
    int? userId,
    int? leaveId,
    DateTime? leaveTime,
    String? leaveReason,
  }) =>
      LeaveDetails(
        userId: userId ?? this.userId,
        leaveId: leaveId ?? this.leaveId,
        leaveTime: leaveTime ?? this.leaveTime,
        leaveReason: leaveReason ?? this.leaveReason,
      );

  factory LeaveDetails.fromRawJson(String str) => LeaveDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LeaveDetails.fromJson(Map<String, dynamic> json) => LeaveDetails(
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
