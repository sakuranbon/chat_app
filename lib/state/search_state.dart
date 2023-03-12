import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

final searchStateProvider =
StateNotifierProvider<SearchStateNotifier, SearchState>(
      (ref) => SearchStateNotifier(),
);

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default(<UserModel>[]) List<UserModel> searchUsers,
    @Default(false) bool hasUserSearched,
  }) = _SearchState;
}

class SearchStateNotifier extends StateNotifier<SearchState> {
  SearchStateNotifier() : super(const SearchState());

  Future<void> getSearchUser(String userName) async {
    state = state.copyWith(isLoading: true);
    final searchUsers = await FirestoreService().searchAllUser(userName);
    if (!mounted) {
      return;
    }
    state = state.copyWith(
      searchUsers: searchUsers,
      hasUserSearched: true,
    );
    state = state.copyWith(isLoading: false);
  }
}
