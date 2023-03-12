
part of 'register_state.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');


mixin _$RegisterState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  bool get passwordInVisible => throw _privateConstructorUsedError;
  bool get navigateChatRoomPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
      RegisterState value, $Res Function(RegisterState) then) =
  _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {bool isLoading,
        String password,
        UserModel? userModel,
        bool passwordInVisible,
        bool navigateChatRoomPage});

  $UserModelCopyWith<$Res>? get userModel;
}


class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? password,
    Object? userModel = freezed,
    Object? passwordInVisible,
    Object? navigateChatRoomPage,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading
      as bool,
      password: null == password
          ? _value.password
          : password
      as String,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel
      as UserModel?,
      passwordInVisible: null == passwordInVisible
          ? _value.passwordInVisible
          : passwordInVisible
      as bool,
      navigateChatRoomPage: null == navigateChatRoomPage
          ? _value.navigateChatRoomPage
          : navigateChatRoomPage
      as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }
}


abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
      _$_RegisterState value, $Res Function(_$_RegisterState) then) =
  __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
        String password,
        UserModel? userModel,
        bool passwordInVisible,
        bool navigateChatRoomPage});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? password,
    Object? userModel = freezed,
    Object? passwordInVisible,
    Object? navigateChatRoomPage,
  }) {
    return _then(_$_RegisterState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading
      as bool,
      password: null == password
          ? _value.password
          : password
      as String,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel
      as UserModel?,
      passwordInVisible: null == passwordInVisible
          ? _value.passwordInVisible
          : passwordInVisible
      as bool,
      navigateChatRoomPage: null == navigateChatRoomPage
          ? _value.navigateChatRoomPage
          : navigateChatRoomPage
      as bool,
    ));
  }
}


class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {this.isLoading = false,
        this.password = '',
        this.userModel,
        this.passwordInVisible = true,
        this.navigateChatRoomPage = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final UserModel? userModel;
  @override
  @JsonKey()
  final bool passwordInVisible;
  @override
  @JsonKey()
  final bool navigateChatRoomPage;

  @override
  String toString() {
    return 'RegisterState(isLoading: $isLoading, password: $password, userModel: $userModel, passwordInVisible: $passwordInVisible, navigateChatRoomPage: $navigateChatRoomPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.passwordInVisible, passwordInVisible) ||
                other.passwordInVisible == passwordInVisible) &&
            (identical(other.navigateChatRoomPage, navigateChatRoomPage) ||
                other.navigateChatRoomPage == navigateChatRoomPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, password, userModel,
      passwordInVisible, navigateChatRoomPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {final bool isLoading,
        final String password,
        final UserModel? userModel,
        final bool passwordInVisible,
        final bool navigateChatRoomPage}) = _$_RegisterState;

  @override
  bool get isLoading;
  @override
  String get password;
  @override
  UserModel? get userModel;
  @override
  bool get passwordInVisible;
  @override
  bool get navigateChatRoomPage;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
