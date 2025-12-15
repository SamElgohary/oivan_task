import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_app_bar.dart';
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

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load first page
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

    final thresholdReached =
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200;

    if (thresholdReached) {
      ref.read(usersViewModelProvider.notifier).loadMoreUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final UsersState state = ref.watch(usersViewModelProvider);

    final bookmarkedUsers = ref.watch(bookmarkViewModelProvider);
    final bookmarkNotifier =
    ref.read(bookmarkViewModelProvider.notifier);

    // Initial loading
    if (state.isLoading && state.users.isEmpty) {
      return const Scaffold(
        appBar: AppAppBar(title: AppStrings.usersTitle),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Error state
    if (state.errorMessage != null && state.users.isEmpty) {
      return Scaffold(
        appBar: const AppAppBar(title: AppStrings.usersTitle),
        body: Center(
          child: Text(state.errorMessage!),
        ),
      );
    }

    return Scaffold(
      appBar: const AppAppBar(title: AppStrings.usersTitle),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: state.users.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          // Pagination loader
          if (index >= state.users.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final user = state.users[index];

          final isBookmarked =
          bookmarkedUsers.any((u) => u.id == user.id);

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage),
            ),
            title: Text(user.displayName),
            subtitle:
            Text('${AppStrings.reputation} ${user.reputation}'),
            trailing: IconButton(
              icon: Icon(
                isBookmarked
                    ? Icons.bookmark_added
                    : Icons.bookmark_border,
                color: isBookmarked
                    ? AppColors.primary
                    : AppColors.textSecondary,
              ),
              onPressed: () {
                bookmarkNotifier.toggle(user);
              },
            ),
          );
        },
      ),
    );
  }
}
