import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/user_card.dart';
import '../../../../core/utils/app_strings.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(bookmarkViewModelProvider);
    final bookmarkNotifier =
    ref.read(bookmarkViewModelProvider.notifier);

    if (users.isEmpty) {
      return const Scaffold(
        appBar: AppAppBar(
          title: AppStrings.bookmarks,
          showLeading: true,
          hasActions: false,
        ),
        body: Center(child: Text(AppStrings.noBookMarksYet)),
      );
    }

    return Scaffold(
      appBar: const AppAppBar(
        title: AppStrings.bookmarks,
        showLeading: true,
        hasActions: false,
      ),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final user = users[index];

          return UserCard(
            user: user,
            isBookmarked: true,
            onBookmarkTap: () {
              bookmarkNotifier.toggle(user);
            },
          );
        },
      ),
    );
  }
}
