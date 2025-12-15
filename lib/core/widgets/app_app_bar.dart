import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.title,
    this.showBack = false,
  });

  final String title;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: showBack ? const BackButton(color: AppColors.textPrimary) : null,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,

        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
