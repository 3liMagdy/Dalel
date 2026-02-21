
import 'package:dalel/core/database/cache/cacheKeys.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOnBoarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }

  Future<void> _checkOnBoarding() async {
    await Future.delayed(const Duration(seconds: 2));

    final visited = CacheHelper.sharedPreferences
            .getBool(CacheKeys.onBoardingVisited) ??
        false;

    if (!mounted) return;

    // Use GoRouter's `go` to replace the stack.
    if (visited) {
      context.go(AppRouter.kSignInRoute);
    } else {
      context.go(AppRouter.konBoardingRoute);
    }
  }
}