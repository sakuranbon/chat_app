import 'package:chat_app/time_stamp_date_time_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String messageText,
    @Default([]) List<String> readMembers,
    @TimestampDateTimeConverter() DateTime? sendTime,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? deletedAt,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  factory ChatModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) =>
      ChatModel.fromJson(snapshot.data()!);
}
