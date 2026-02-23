import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/home/presentation/views/view/home_view.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String ksplashRoute = "/";
  static const String konBoardingRoute = "/onBoarding";
  static const String kSignUpRoute = "/signUp";
  static const String kSignInRoute = "/signIn";
  static const String kHomeRoute = "/home";
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRouter.ksplashRoute,
      builder: (context, state) => const SplashView(),
    ),

    GoRoute(
      path: AppRouter.konBoardingRoute,
      builder: (context, state) => OnBoardingView(),
    ),
    GoRoute(
      path: AppRouter.kSignUpRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: AppRouter.kSignInRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
      GoRoute(
      path: AppRouter.kHomeRoute,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
