import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/time_stamp_date_time_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    @Default('') String roomId,
    @Default([]) List<String> members,
    @Default('') String recentMessage,
    @Default(null) String? recentMessageSender,
    @TimestampDateTimeConverter() DateTime? recentMessageTime,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @Default(null) UserModel? friend, // 相手のユーザ情報
    @Default(0) int unRead, // 未読チャット数
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  factory RoomModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) =>
      RoomModel.fromJson(snapshot.data()!);
}
