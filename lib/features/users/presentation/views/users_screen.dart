import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/widgets/app_app_bar.dart';
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

    // load first page
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
    final state = ref.read(usersViewModelProvider);

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

    final bookmarks = ref.watch(bookmarkViewModelProvider);
    final bookmarkNotifier =
    ref.read(bookmarkViewModelProvider.notifier);

    if (state.isLoading && state.users.isEmpty) {
      return const Scaffold(
        appBar: const AppAppBar(title: 'Users'),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.errorMessage != null && state.users.isEmpty) {
      return Scaffold(
        appBar: const AppAppBar(title: 'Users'),
        body: Center(
          child: Text(state.errorMessage!),
        ),
      );
    }

    return Scaffold(
      appBar: const AppAppBar(title: 'Users'),
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

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage),
            ),
            trailing: IconButton(
              icon: Icon(
                bookmarks.contains(user.id)
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                bookmarkNotifier.toggle(user);
              },
            ),
            title: Text(user.displayName),
            subtitle: Text('Reputation: ${user.reputation}'),
          );
        },
      ),
    );
  }
}
