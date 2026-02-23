import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/features/auth/presentation/widgets/banner_sign_in.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_signin_from.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        
        slivers: [
          SliverToBoxAdapter(child: BannerSignIn()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcomeBack)),
          SliverToBoxAdapter(child: SizedBox(height: 42)),
          SliverToBoxAdapter(child: CustomSigninFrom(),)
          ],
      ),
    );
  }
}


