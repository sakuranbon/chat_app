
part of 'profile_state.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');


mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}


abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
      ProfileState value, $Res Function(ProfileState) then) =
  _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({bool isLoading, String userName, File? imageFile});
}


class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);


  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? userName,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading
      as bool,
      userName: null == userName
          ? _value.userName
          : userName
      as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile
      as File?,
    ) as $Val);
  }
}

abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
      _$_ProfileState value, $Res Function(_$_ProfileState) then) =
  __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String userName, File? imageFile});
}


class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileState>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading,
    Object? userName,
    Object? imageFile = freezed,
  }) {
    return _then(_$_ProfileState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading
      as bool,
      userName: null == userName
          ? _value.userName
          : userName
      as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile
      as File?,
    ));
  }
}


class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {this.isLoading = false, this.userName = '', this.imageFile = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final File? imageFile;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, userName: $userName, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userName, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final bool isLoading,
        final String userName,
        final File? imageFile}) = _$_ProfileState;

  @override
  bool get isLoading;
  @override
  String get userName;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
