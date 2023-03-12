
part of 'room_model.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}


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


class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);


  final $Val _value;

  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId,
    Object? members,
    Object? recentMessage,
    Object? recentMessageSender = freezed,
    Object? recentMessageTime = freezed,
    Object? createdAt = freezed,
    Object? friend = freezed,
    Object? unRead,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId
      as String,
      members: null == members
          ? _value.members
          : members
      as List<String>,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage
      as String,
      recentMessageSender: freezed == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender
      as String?,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt
      as DateTime?,
      friend: freezed == friend
          ? _value.friend
          : friend
      as UserModel?,
      unRead: null == unRead
          ? _value.unRead
          : unRead
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

class __$$_RoomModelCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$_RoomModel>
    implements _$$_RoomModelCopyWith<$Res> {
  __$$_RoomModelCopyWithImpl(
      _$_RoomModel _value, $Res Function(_$_RoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId,
    Object? members,
    Object? recentMessage,
    Object? recentMessageSender = freezed,
    Object? recentMessageTime = freezed,
    Object? createdAt = freezed,
    Object? friend = freezed,
    Object? unRead,
  }) {
    return _then(_$_RoomModel(
      roomId: null == roomId
          ? _value.roomId
          : roomId
      as String,
      members: null == members
          ? _value._members
          : members
      as List<String>,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage
      as String,
      recentMessageSender: freezed == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender
      as String?,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt
      as DateTime?,
      friend: freezed == friend
          ? _value.friend
          : friend
      as UserModel?,
      unRead: null == unRead
          ? _value.unRead
          : unRead
      as int,
    ));
  }
}


@JsonSerializable()
class _$_RoomModel implements _RoomModel {
  const _$_RoomModel(
      {this.roomId = '',
        final List<String> members = const [],
        this.recentMessage = '',
        this.recentMessageSender,
        @TimestampDateTimeConverter() this.recentMessageTime,
        @TimestampDateTimeConverter() this.createdAt,
        this.friend,
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
  @override
  int get unRead;
  @override
  @JsonKey(ignore: true)
  _$$_RoomModelCopyWith<_$_RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
