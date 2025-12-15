import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oivan_task/core/router/app_routes.dart';
import 'package:oivan_task/features/bookmarks/presentation/views/bookmarks_screen.dart';
import 'package:oivan_task/features/splash_screen/presentation/views/splash_screen.dart';

import '../../features/users/presentation/views/users_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name:AppRoutes.splash ,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.usersScreen,
        name: AppRoutes.usersScreen,
        builder: (_, __) => const UsersScreen(),
      ),

      GoRoute(
        path: AppRoutes.bookmarksScreen,
        name: AppRoutes.bookmarksScreen,
        builder: (_, __) => const BookmarksScreen(),
      ),
    ],
  );
});
