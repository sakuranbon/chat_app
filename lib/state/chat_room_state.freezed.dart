
part of 'chat_room_state.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

mixin _$ChatState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
  _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({bool isLoading, String roomId});
}


class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? roomId,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading
      as bool,
      roomId: null == roomId
          ? _value.roomId
          : roomId
      as String,
    ) as $Val);
  }
}


abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
      _$_ChatState value, $Res Function(_$_ChatState) then) =
  __$$_ChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String roomId});
}


class __$$_ChatStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatState>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? roomId,
  }) {
    return _then(_$_ChatState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
      as bool,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }
}



class _$_ChatState implements _ChatState {
  const _$_ChatState({this.isLoading = false, this.roomId = ''});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String roomId;

  @override
  String toString() {
    return 'ChatState(isLoading: $isLoading, roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({final bool isLoading, final String roomId}) =
  _$_ChatState;

  @override
  bool get isLoading;
  @override
  String get roomId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
