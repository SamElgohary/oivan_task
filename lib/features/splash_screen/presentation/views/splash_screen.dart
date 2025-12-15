import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oivan_task/core/router/app_routes.dart';
import 'package:oivan_task/core/theme/app_colors.dart';

import '../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go(AppRoutes.usersScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          Assets.imagesLogo,
        )
      ),
    );
  }
}
