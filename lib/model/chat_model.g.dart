// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
  id: json['id'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  messageText: json['messageText'] as String? ?? '',
  readMembers: (json['readMembers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList() ??
      const [],
  sendTime: const TimestampDateTimeConverter()
      .fromJson(json['sendTime'] as Timestamp?),
  createdAt: const TimestampDateTimeConverter()
      .fromJson(json['createdAt'] as Timestamp?),
  deletedAt: const TimestampDateTimeConverter()
      .fromJson(json['deletedAt'] as Timestamp?),
);

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'messageText': instance.messageText,
      'readMembers': instance.readMembers,
      'sendTime': const TimestampDateTimeConverter().toJson(instance.sendTime),
      'createdAt':
      const TimestampDateTimeConverter().toJson(instance.createdAt),
      'deletedAt':
      const TimestampDateTimeConverter().toJson(instance.deletedAt),
    };
