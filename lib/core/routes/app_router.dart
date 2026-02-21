


import 'package:dalel/features/on_boarding/presentation/views/on_boarding_model.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String ksplashRoute = "/";
  static const String konBoardingRoute = "/onBoarding";
}
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRouter.ksplashRoute,
      builder: (context, state) => const SplashView(),
    ),
    
    GoRoute(
      path: AppRouter.konBoardingRoute,
      builder: (context, state) => const OnBoardingView(),
    ),
    ]
    );