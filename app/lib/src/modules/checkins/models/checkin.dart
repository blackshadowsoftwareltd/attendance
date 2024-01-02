import 'dart:convert';

class Checkin {
    int? userId;
    int? checkInId;
    DateTime? checkInTime;

    Checkin({
        this.userId,
        this.checkInId,
        this.checkInTime,
    });

    Checkin copyWith({
        int? userId,
        int? checkInId,
        DateTime? checkInTime,
    }) => 
        Checkin(
            userId: userId ?? this.userId,
            checkInId: checkInId ?? this.checkInId,
            checkInTime: checkInTime ?? this.checkInTime,
        );

    factory Checkin.fromRawJson(String str) => Checkin.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Checkin.fromJson(Map<String, dynamic> json) => Checkin(
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
