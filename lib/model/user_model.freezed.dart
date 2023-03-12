
part of 'user_model.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}


mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  RoomModel? get room => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
  _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
        String name,
        String email,
        String? profilePic,
        RoomModel? room,
        String password});

  $RoomModelCopyWith<$Res>? get room;
}


class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);


  final $Val _value;

  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid,
    Object? name,
    Object? email,
    Object? profilePic = freezed,
    Object? room = freezed,
    Object? password,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid
      as String,
      name: null == name
          ? _value.name
          : name
      as String,
      email: null == email
          ? _value.email
          : email
      as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic
      as String?,
      room: freezed == room
          ? _value.room
          : room
      as RoomModel?,
      password: null == password
          ? _value.password
          : password
      as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomModelCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }
}


abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
      _$_UserModel value, $Res Function(_$_UserModel) then) =
  __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
        String name,
        String email,
        String? profilePic,
        RoomModel? room,
        String password});

  @override
  $RoomModelCopyWith<$Res>? get room;
}


class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid,
    Object? name,
    Object? email,
    Object? profilePic = freezed,
    Object? room = freezed,
    Object? password,
  }) {
    return _then(_$_UserModel(
      uid: null == uid
          ? _value.uid
          : uid
      as String,
      name: null == name
          ? _value.name
          : name
      as String,
      email: null == email
          ? _value.email
          : email
      as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic
      as String?,
      room: freezed == room
          ? _value.room
          : room
      as RoomModel?,
      password: null == password
          ? _value.password
          : password
      as String,
    ));
  }
}


@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.uid = '',
        this.name = '',
        this.email = '',
        this.profilePic,
        this.room,
        this.password = ''});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String? profilePic;
  @override
  @JsonKey()
  final RoomModel? room;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, profilePic: $profilePic, room: $room, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, name, email, profilePic, room, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String uid,
        final String name,
        final String email,
        final String? profilePic,
        final RoomModel? room,
        final String password}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
  _$_UserModel.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get profilePic;
  @override
  RoomModel? get room;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
