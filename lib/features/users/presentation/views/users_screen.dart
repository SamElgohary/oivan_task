import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/user_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../viewmodels/users_state.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);

    Future.microtask(() {
      ref.read(usersViewModelProvider.notifier).loadUsers();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final reachedBottom =
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200;

    if (reachedBottom) {
      ref.read(usersViewModelProvider.notifier).loadMoreUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersViewModelProvider);
    final bookmarkedUsers = ref.watch(bookmarkViewModelProvider);
    final bookmarkNotifier =
    ref.read(bookmarkViewModelProvider.notifier);

    // Loading (first page)
    if (state.isLoading && state.users.isEmpty) {
      return const Scaffold(
        appBar: const AppAppBar(title: AppStrings.usersTitle,hasActions: true,),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Error (no data)
    if (state.errorMessage != null && state.users.isEmpty) {
      return Scaffold(
        appBar: const AppAppBar(title: AppStrings.usersTitle,hasActions: true,),
        body: Center(child: Text(state.errorMessage!)),
      );
    }

    return Scaffold(
      appBar: const AppAppBar(title: AppStrings.usersTitle,hasActions: true,),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: state.users.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.users.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final user = state.users[index];
          final isBookmarked =
          bookmarkedUsers.any((u) => u.id == user.id);

          return UserCard(
            user: user,
            isBookmarked: isBookmarked,
            onBookmarkTap: () {
              bookmarkNotifier.toggle(user);
            },
          );
        },
      ),
    );
  }
}
