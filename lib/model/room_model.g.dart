// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
  roomId: json['roomId'] as String? ?? '',
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList() ??
      const [],
  recentMessage: json['recentMessage'] as String? ?? '',
  recentMessageSender: json['recentMessageSender'] as String? ?? null,
  recentMessageTime: const TimestampDateTimeConverter()
      .fromJson(json['recentMessageTime'] as Timestamp?),
  createdAt: const TimestampDateTimeConverter()
      .fromJson(json['createdAt'] as Timestamp?),
  friend: json['friend'] == null
      ? null
      : UserModel.fromJson(json['friend'] as Map<String, dynamic>),
  unRead: json['unRead'] as int? ?? 0,
);

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'members': instance.members,
      'recentMessage': instance.recentMessage,
      'recentMessageSender': instance.recentMessageSender,
      'recentMessageTime':
      const TimestampDateTimeConverter().toJson(instance.recentMessageTime),
      'createdAt':
      const TimestampDateTimeConverter().toJson(instance.createdAt),
      'friend': instance.friend,
      'unRead': instance.unRead,
    };
