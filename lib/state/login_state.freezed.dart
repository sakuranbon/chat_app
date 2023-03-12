
part of 'login_state.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');


mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  SharedPreferencesData? get sharedPreferencesData =>
      throw _privateConstructorUsedError;
  Auth? get auth => throw _privateConstructorUsedError;
  bool get passwordInVisible => throw _privateConstructorUsedError;
  bool get navigateChatRoomPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
      LoginState value, $Res Function(LoginState) then) =
  _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
        String password,
        UserModel? userModel,
        SharedPreferencesData? sharedPreferencesData,
        Auth? auth,
        bool passwordInVisible,
        bool navigateChatRoomPage});

  $UserModelCopyWith<$Res>? get userModel;
}


class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);


  final $Val _value;

  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? password,
    Object? userModel = freezed,
    Object? sharedPreferencesData = freezed,
    Object? auth = freezed,
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
      sharedPreferencesData: freezed == sharedPreferencesData
          ? _value.sharedPreferencesData
          : sharedPreferencesData
      as SharedPreferencesData?,
      auth: freezed == auth
          ? _value.auth
          : auth
      as Auth?,
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

abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
      _$_LoginState value, $Res Function(_$_LoginState) then) =
  __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
        String password,
        UserModel? userModel,
        SharedPreferencesData? sharedPreferencesData,
        Auth? auth,
        bool passwordInVisible,
        bool navigateChatRoomPage});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? password,
    Object? userModel = freezed,
    Object? sharedPreferencesData = freezed,
    Object? auth = freezed,
    Object? passwordInVisible,
    Object? navigateChatRoomPage,
  }) {
    return _then(_$_LoginState(
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
      sharedPreferencesData: freezed == sharedPreferencesData
          ? _value.sharedPreferencesData
          : sharedPreferencesData
      as SharedPreferencesData?,
      auth: freezed == auth
          ? _value.auth
          : auth
      as Auth?,
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


class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {this.isLoading = false,
        this.password = '',
        this.userModel,
        this.sharedPreferencesData,
        this.auth,
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
  final SharedPreferencesData? sharedPreferencesData;
  @override
  @JsonKey()
  final Auth? auth;
  @override
  @JsonKey()
  final bool passwordInVisible;
  @override
  @JsonKey()
  final bool navigateChatRoomPage;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, password: $password, userModel: $userModel, sharedPreferencesData: $sharedPreferencesData, auth: $auth, passwordInVisible: $passwordInVisible, navigateChatRoomPage: $navigateChatRoomPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.sharedPreferencesData, sharedPreferencesData) ||
                other.sharedPreferencesData == sharedPreferencesData) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.passwordInVisible, passwordInVisible) ||
                other.passwordInVisible == passwordInVisible) &&
            (identical(other.navigateChatRoomPage, navigateChatRoomPage) ||
                other.navigateChatRoomPage == navigateChatRoomPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, password, userModel,
      sharedPreferencesData, auth, passwordInVisible, navigateChatRoomPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final bool isLoading,
        final String password,
        final UserModel? userModel,
        final SharedPreferencesData? sharedPreferencesData,
        final Auth? auth,
        final bool passwordInVisible,
        final bool navigateChatRoomPage}) = _$_LoginState;

  @override
  bool get isLoading;
  @override
  String get password;
  @override
  UserModel? get userModel;
  @override
  SharedPreferencesData? get sharedPreferencesData;
  @override
  Auth? get auth;
  @override
  bool get passwordInVisible;
  @override
  bool get navigateChatRoomPage;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
