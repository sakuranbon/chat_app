
part of 'chat_model.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}


mixin _$ChatModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get messageText => throw _privateConstructorUsedError;
  List<String> get readMembers => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get sendTime => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
  _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {String id,
        String userId,
        String messageText,
        List<String> readMembers,
        @TimestampDateTimeConverter() DateTime? sendTime,
        @TimestampDateTimeConverter() DateTime? createdAt,
        @TimestampDateTimeConverter() DateTime? deletedAt});
}

class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);


  final $Val _value;

  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id,
    Object? userId,
    Object? messageText,
    Object? readMembers,
    Object? sendTime = freezed,
    Object? createdAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id
      as String,
      userId: null == userId
          ? _value.userId
          : userId
      as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText
      as String,
      readMembers: null == readMembers
          ? _value.readMembers
          : readMembers
      as List<String>,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt
      as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt
      as DateTime?,
    ) as $Val);
  }
}


abstract class _$$_ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$_ChatModelCopyWith(
      _$_ChatModel value, $Res Function(_$_ChatModel) then) =
  __$$_ChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
        String userId,
        String messageText,
        List<String> readMembers,
        @TimestampDateTimeConverter() DateTime? sendTime,
        @TimestampDateTimeConverter() DateTime? createdAt,
        @TimestampDateTimeConverter() DateTime? deletedAt});
}


class __$$_ChatModelCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$_ChatModel>
    implements _$$_ChatModelCopyWith<$Res> {
  __$$_ChatModelCopyWithImpl(
      _$_ChatModel _value, $Res Function(_$_ChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id,
    Object? userId,
    Object? messageText,
    Object? readMembers,
    Object? sendTime = freezed,
    Object? createdAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$_ChatModel(
      id: null == id
          ? _value.id
          : id
      as String,
      userId: null == userId
          ? _value.userId
          : userId
      as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText
      as String,
      readMembers: null == readMembers
          ? _value._readMembers
          : readMembers
      as List<String>,
      sendTime: freezed == sendTime
          ? _value.sendTime
          : sendTime
      as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt
      as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt
      as DateTime?,
    ));
  }
}


@JsonSerializable()
class _$_ChatModel implements _ChatModel {
  const _$_ChatModel(
      {this.id = '',
        this.userId = '',
        this.messageText = '',
        final List<String> readMembers = const [],
        @TimestampDateTimeConverter() this.sendTime,
        @TimestampDateTimeConverter() this.createdAt,
        @TimestampDateTimeConverter() this.deletedAt})
      : _readMembers = readMembers;

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String messageText;
  final List<String> _readMembers;
  @override
  @JsonKey()
  List<String> get readMembers {
    if (_readMembers is EqualUnmodifiableListView) return _readMembers;

    return EqualUnmodifiableListView(_readMembers);
  }

  @override
  @TimestampDateTimeConverter()
  final DateTime? sendTime;
  @override
  @TimestampDateTimeConverter()
  final DateTime? createdAt;
  @override
  @TimestampDateTimeConverter()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'ChatModel(id: $id, userId: $userId, messageText: $messageText, readMembers: $readMembers, sendTime: $sendTime, createdAt: $createdAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            const DeepCollectionEquality()
                .equals(other._readMembers, _readMembers) &&
            (identical(other.sendTime, sendTime) ||
                other.sendTime == sendTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      messageText,
      const DeepCollectionEquality().hash(_readMembers),
      sendTime,
      createdAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      __$$_ChatModelCopyWithImpl<_$_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {final String id,
        final String userId,
        final String messageText,
        final List<String> readMembers,
        @TimestampDateTimeConverter() final DateTime? sendTime,
        @TimestampDateTimeConverter() final DateTime? createdAt,
        @TimestampDateTimeConverter() final DateTime? deletedAt}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
  _$_ChatModel.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get messageText;
  @override
  List<String> get readMembers;
  @override
  @TimestampDateTimeConverter()
  DateTime? get sendTime;
  @override
  @TimestampDateTimeConverter()
  DateTime? get createdAt;
  @override
  @TimestampDateTimeConverter()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
