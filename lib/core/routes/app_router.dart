import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/forget_password_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/auth/presentation/view/verify_account_view.dart';
import 'package:dalel/features/home/presentation/views/view/home_view.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String ksplashRoute = "/";
  static const String konBoardingRoute = "/onBoarding";
  static const String kHomeRoute = "/home";
static const String kAuthRoute = "/auth";
static const String kSignInRoute = "/auth/signin";
static const String kSignUpRoute = "/auth/signup";
static const String kVerificationRoute = "/auth/verification";
static const String kForgetPasswordRoute = "/auth/forget";
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
 ShellRoute(
  builder: (context, state, child) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: child,
    );
  },
  routes: [

    GoRoute(
      path: "/auth/signin",
      builder: (context, state) => const SignInView(),
    ),

    GoRoute(
      path: "/auth/signup",
      builder: (context, state) => const SignUpView(),
    ),

    GoRoute(
      path: "/auth/verification",
      builder: (context, state) => const VerifyAccountView(),
    ),

    GoRoute(
      path: "/auth/forget",
      builder: (context, state) => const ForgetPasswordView(),
    ),
  ],
),
      GoRoute(
      path: AppRouter.kHomeRoute,
      builder: (context, state) => const HomeView(),
    ),
     

  ],
);
