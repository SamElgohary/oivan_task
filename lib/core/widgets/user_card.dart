import 'package:flutter/material.dart';
import '../../features/users/domain/entities/sof_user.dart';
import '../theme/app_colors.dart';
import '../utils/app_strings.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  final SofUser user;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profileImage),
      ),
      title: Text(user.displayName),
      subtitle: Text('${AppStrings.reputation} ${user.reputation}'),
      trailing: IconButton(
        icon: Icon(
          isBookmarked
              ? Icons.bookmark_added
              : Icons.bookmark_border,
          color: isBookmarked
              ? AppColors.primary
              : AppColors.textSecondary,
        ),
        onPressed: onBookmarkTap,
      ),
    );
  }
}
