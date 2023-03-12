// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserModel> get searchUsers => throw _privateConstructorUsedError;
  bool get hasUserSearched => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
      SearchState value, $Res Function(SearchState) then) =
  _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool isLoading, List<UserModel> searchUsers, bool hasUserSearched});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchUsers = null,
    Object? hasUserSearched = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
      as bool,
      searchUsers: null == searchUsers
          ? _value.searchUsers
          : searchUsers // ignore: cast_nullable_to_non_nullable
      as List<UserModel>,
      hasUserSearched: null == hasUserSearched
          ? _value.hasUserSearched
          : hasUserSearched // ignore: cast_nullable_to_non_nullable
      as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
      _$_SearchState value, $Res Function(_$_SearchState) then) =
  __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, List<UserModel> searchUsers, bool hasUserSearched});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchUsers = null,
    Object? hasUserSearched = null,
  }) {
    return _then(_$_SearchState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
      as bool,
      searchUsers: null == searchUsers
          ? _value._searchUsers
          : searchUsers // ignore: cast_nullable_to_non_nullable
      as List<UserModel>,
      hasUserSearched: null == hasUserSearched
          ? _value.hasUserSearched
          : hasUserSearched // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.isLoading = false,
        final List<UserModel> searchUsers = const <UserModel>[],
        this.hasUserSearched = false})
      : _searchUsers = searchUsers;

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserModel> _searchUsers;
  @override
  @JsonKey()
  List<UserModel> get searchUsers {
    if (_searchUsers is EqualUnmodifiableListView) return _searchUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchUsers);
  }

  @override
  @JsonKey()
  final bool hasUserSearched;

  @override
  String toString() {
    return 'SearchState(isLoading: $isLoading, searchUsers: $searchUsers, hasUserSearched: $hasUserSearched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchUsers, _searchUsers) &&
            (identical(other.hasUserSearched, hasUserSearched) ||
                other.hasUserSearched == hasUserSearched));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_searchUsers), hasUserSearched);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final bool isLoading,
        final List<UserModel> searchUsers,
        final bool hasUserSearched}) = _$_SearchState;

  @override
  bool get isLoading;
  @override
  List<UserModel> get searchUsers;
  @override
  bool get hasUserSearched;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
