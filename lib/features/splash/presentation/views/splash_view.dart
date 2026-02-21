
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delay_navigate(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStrings.appName,style:CustomTextStyles.pacifico400style64 ,),
      ),
    );
  }
}

void delay_navigate(context) {
   Future.delayed(const Duration(seconds: 2),
     () => customNavigatepushReplacement(context, AppRouter.konBoardingRoute));
}