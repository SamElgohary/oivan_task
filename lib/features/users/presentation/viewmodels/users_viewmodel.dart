import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../domain/usecases/get_users_usecase.dart';
import 'users_state.dart';

class UsersViewModel extends Notifier<UsersState> {
  late final GetUsersUseCase _getUsersUseCase;

  @override
  UsersState build() {
    _getUsersUseCase = ref.read(getUsersUseCaseProvider);
    return const UsersState();
  }

  /// Load first page
  Future<void> loadUsers() async {
    if (state.isLoading) return;

    state = state.copyWith(
      isLoading: true,
      isLoadingMore: false,
      errorMessage: null,
      currentPage: 1,
      hasMore: true,
      users: const [],
    );

    try {
      final result = await _getUsersUseCase(
        page: 1,
        pageSize: 30,
      );

      state = state.copyWith(
        users: result.users,
        hasMore: result.hasMore,
        isLoading: false,
        currentPage: 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Load next page (pagination)
  Future<void> loadMoreUsers() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    final nextPage = state.currentPage + 1;

    try {
      final result = await _getUsersUseCase(
        page: nextPage,
        pageSize: 30,
      );

      state = state.copyWith(
        users: [...state.users, ...result.users],
        hasMore: result.hasMore,
        isLoadingMore: false,
        currentPage: nextPage,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMore: false,
        errorMessage: e.toString(),
      );
    }
  }
}
