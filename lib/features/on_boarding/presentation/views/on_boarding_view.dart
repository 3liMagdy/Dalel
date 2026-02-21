import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(pagesCount: 3,),
      child: BlocListener<OnBoardingCubit, OnBoardingState>(
        listenWhen: (previous, current) =>
            previous.navigation != current.navigation &&
            current.navigation != OnBoardingNavigation.none,
        listener: (context, state) {
          if (state.navigation == OnBoardingNavigation.signUp) {
            context.go(AppRouter.kSignUpRoute);
          } else if (state.navigation == OnBoardingNavigation.signIn) {
            context.go(AppRouter.kSignInRoute);
          }

          context.read<OnBoardingCubit>().clearNavigation();
        },
        child: const Scaffold(
          body: SafeArea(
            child: OnBoardingWidgetBody(),
          ),
        ),
      ),
    );
  }
}