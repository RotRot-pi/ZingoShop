// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Notifications {
  int notificationId;
  int notificationUserId;
  String notificationTitle;
  String notificationBody;
  String notificationTime;
  Notifications({
    required this.notificationId,
    required this.notificationUserId,
    required this.notificationTitle,
    required this.notificationBody,
    required this.notificationTime,
  });

  Notifications copyWith({
    int? notificationId,
    int? notificationUserId,
    String? notificationTitle,
    String? notificationBody,
    String? notificationTime,
  }) {
    return Notifications(
      notificationId: notificationId ?? this.notificationId,
      notificationUserId: notificationUserId ?? this.notificationUserId,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      notificationBody: notificationBody ?? this.notificationBody,
      notificationTime: notificationTime ?? this.notificationTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notification_id': notificationId,
      'notification_user_id': notificationUserId,
      'notification_title': notificationTitle,
      'notification_body': notificationBody,
      'notification_date_time': notificationTime
    };
  }

  factory Notifications.fromMap(Map<String, dynamic> map) {
    return Notifications(
      notificationId: map['notification_id'] as int,
      notificationUserId: map['notification_user_id'] as int,
      notificationTitle: map['notification_title'] as String,
      notificationBody: map['notification_body'] as String,
      notificationTime: map['notification_date_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notifications.fromJson(String source) =>
      Notifications.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notifications(notificationId: $notificationId, notificationUserId: $notificationUserId, notificationTitle: $notificationTitle, notificationBody: $notificationBody, notificationTime: $notificationTime)';
  }

  @override
  bool operator ==(covariant Notifications other) {
    if (identical(this, other)) return true;

    return other.notificationId == notificationId &&
        other.notificationUserId == notificationUserId &&
        other.notificationTitle == notificationTitle &&
        other.notificationBody == notificationBody &&
        other.notificationTime == notificationTime;
  }

  @override
  int get hashCode {
    return notificationId.hashCode ^
        notificationUserId.hashCode ^
        notificationTitle.hashCode ^
        notificationBody.hashCode ^
        notificationTime.hashCode;
  }
}
