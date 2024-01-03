import 'dart:convert';

class ApiError {
  int? status;
  List<String>? reason;

  ApiError({
    this.status,
    this.reason,
  });

  ApiError copyWith({
    int? status,
    List<String>? reason,
  }) =>
      ApiError(
        status: status ?? this.status,
        reason: reason ?? this.reason,
      );

  factory ApiError.fromRawJson(String str) => ApiError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        status: json["status"],
        reason: json["reason"] == null ? [] : List<String>.from(json["reason"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "reason": reason == null ? [] : List<dynamic>.from(reason!.map((x) => x)),
      };
}
