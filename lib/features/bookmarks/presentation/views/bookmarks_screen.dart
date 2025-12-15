import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oivan_task/core/utils/app_strings.dart';

import '../../../../core/di/providers.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/theme/app_colors.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(bookmarkViewModelProvider);

    if (users.isEmpty) {
      return const Scaffold(
          appBar: const AppAppBar(title: AppStrings.bookmarks, showLeading: true,hasActions: false,),
          body: Center(child: Text(AppStrings.noBookMarksYet)));
    };


    return Scaffold(
      appBar: const AppAppBar(title: AppStrings.bookmarks, showLeading: true,hasActions: false,),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profileImage),
            ),
            title: Text(user.displayName),
            subtitle: Text('${AppStrings.reputation} ${user.reputation}'),
            trailing: IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: AppColors.primary,
              ),
              onPressed: () {
                ref
                    .read(bookmarkViewModelProvider.notifier)
                    .toggle(user);
              },
            ),
          );
        },
      ),
    );
  }
}
