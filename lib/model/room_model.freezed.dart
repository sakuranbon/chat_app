// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  String get roomId => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get recentMessage => throw _privateConstructorUsedError;
  String? get recentMessageSender => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get recentMessageTime => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserModel? get friend => throw _privateConstructorUsedError; // 相手のユーザ情報
  int get unRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
  _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call(
      {String roomId,
        List<String> members,
        String recentMessage,
        String? recentMessageSender,
        @TimestampDateTimeConverter() DateTime? recentMessageTime,
        @TimestampDateTimeConverter() DateTime? createdAt,
        UserModel? friend,
        int unRead});

  $UserModelCopyWith<$Res>? get friend;
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? members = null,
    Object? recentMessage = null,
    Object? recentMessageSender = freezed,
    Object? recentMessageTime = freezed,
    Object? createdAt = freezed,
    Object? friend = freezed,
    Object? unRead = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
      as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
      as List<String>,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
      as String,
      recentMessageSender: freezed == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender // ignore: cast_nullable_to_non_nullable
      as String?,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
      as UserModel?,
      unRead: null == unRead
          ? _value.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
      as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get friend {
    if (_value.friend == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.friend!, (value) {
      return _then(_value.copyWith(friend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoomModelCopyWith<$Res> implements $RoomModelCopyWith<$Res> {
  factory _$$_RoomModelCopyWith(
      _$_RoomModel value, $Res Function(_$_RoomModel) then) =
  __$$_RoomModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
        List<String> members,
        String recentMessage,
        String? recentMessageSender,
        @TimestampDateTimeConverter() DateTime? recentMessageTime,
        @TimestampDateTimeConverter() DateTime? createdAt,
        UserModel? friend,
        int unRead});

  @override
  $UserModelCopyWith<$Res>? get friend;
}

/// @nodoc
class __$$_RoomModelCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$_RoomModel>
    implements _$$_RoomModelCopyWith<$Res> {
  __$$_RoomModelCopyWithImpl(
      _$_RoomModel _value, $Res Function(_$_RoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? members = null,
    Object? recentMessage = null,
    Object? recentMessageSender = freezed,
    Object? recentMessageTime = freezed,
    Object? createdAt = freezed,
    Object? friend = freezed,
    Object? unRead = null,
  }) {
    return _then(_$_RoomModel(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
      as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
      as List<String>,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
      as String,
      recentMessageSender: freezed == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender // ignore: cast_nullable_to_non_nullable
      as String?,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      friend: freezed == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
      as UserModel?,
      unRead: null == unRead
          ? _value.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomModel implements _RoomModel {
  const _$_RoomModel(
      {this.roomId = '',
        final List<String> members = const [],
        this.recentMessage = '',
        this.recentMessageSender = null,
        @TimestampDateTimeConverter() this.recentMessageTime,
        @TimestampDateTimeConverter() this.createdAt,
        this.friend = null,
        this.unRead = 0})
      : _members = members;

  factory _$_RoomModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoomModelFromJson(json);

  @override
  @JsonKey()
  final String roomId;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String recentMessage;
  @override
  @JsonKey()
  final String? recentMessageSender;
  @override
  @TimestampDateTimeConverter()
  final DateTime? recentMessageTime;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final UserModel? friend;
// 相手のユーザ情報
  @override
  @JsonKey()
  final int unRead;

  @override
  String toString() {
    return 'RoomModel(roomId: $roomId, members: $members, recentMessage: $recentMessage, recentMessageSender: $recentMessageSender, recentMessageTime: $recentMessageTime, createdAt: $createdAt, friend: $friend, unRead: $unRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomModel &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.recentMessage, recentMessage) ||
                other.recentMessage == recentMessage) &&
            (identical(other.recentMessageSender, recentMessageSender) ||
                other.recentMessageSender == recentMessageSender) &&
            (identical(other.recentMessageTime, recentMessageTime) ||
                other.recentMessageTime == recentMessageTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.friend, friend) || other.friend == friend) &&
            (identical(other.unRead, unRead) || other.unRead == unRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      const DeepCollectionEquality().hash(_members),
      recentMessage,
      recentMessageSender,
      recentMessageTime,
      createdAt,
      friend,
      unRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomModelCopyWith<_$_RoomModel> get copyWith =>
      __$$_RoomModelCopyWithImpl<_$_RoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomModelToJson(
      this,
    );
  }
}

abstract class _RoomModel implements RoomModel {
  const factory _RoomModel(
      {final String roomId,
        final List<String> members,
        final String recentMessage,
        final String? recentMessageSender,
        @TimestampDateTimeConverter() final DateTime? recentMessageTime,
        @TimestampDateTimeConverter() final DateTime? createdAt,
        final UserModel? friend,
        final int unRead}) = _$_RoomModel;

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
  _$_RoomModel.fromJson;

  @override
  String get roomId;
  @override
  List<String> get members;
  @override
  String get recentMessage;
  @override
  String? get recentMessageSender;
  @override
  @TimestampDateTimeConverter()
  DateTime? get recentMessageTime;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  UserModel? get friend;
  @override // 相手のユーザ情報
  int get unRead;
  @override
  @JsonKey(ignore: true)
  _$$_RoomModelCopyWith<_$_RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
