import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sof_user.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    @Default(<SofUser>[]) List<SofUser> users,

    /// loading first page
    @Default(false) bool isLoading,

    /// loading pagination
    @Default(false) bool isLoadingMore,

    /// error message (null = no error)
    String? errorMessage,

    /// API has more pages
    @Default(true) bool hasMore,

    /// current page index
    @Default(1) int currentPage,
  }) = _UsersState;
}
