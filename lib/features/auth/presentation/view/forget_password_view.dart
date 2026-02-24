import 'package:dalel/features/auth/presentation/widgets/bottom_navigationBar_forgotPassword.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_section_one_forgot_password.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Custom_Section_One_Forgot_Password(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarForgotPassword(),
    );
  }
}
