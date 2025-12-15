import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oivan_task/core/router/app_routes.dart';
import '../theme/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.title,
    this.showLeading = false,
    this.hasActions = false,
  });

  final String title;
  final bool showLeading;
  final bool hasActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: showLeading ? const BackButton(color: AppColors.white) : null,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,

        ),
      ),
      actions: [
       hasActions ? IconButton(
          icon: const Icon(Icons.bookmark,color: Colors.white,),
          onPressed: () {
            context.pushNamed(AppRoutes.bookmarksScreen);
          },
        ) :SizedBox.shrink(),
      ],

      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
