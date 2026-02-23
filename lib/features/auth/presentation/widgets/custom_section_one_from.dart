


import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot%20_password.dart';
import 'package:flutter/material.dart';

class Custom_section_one_from extends StatelessWidget {
  const Custom_section_one_from({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          labelText: AppStrings.emailAddress,
          onChanged: (email) {
            // Handle email input change
          },
        ),
        SizedBox(height: 16),
        CustomTextFormField(
          labelText: AppStrings.password,
          obscureText: true,
          onChanged: (password) {
            // Handle password input change
          },
        ),
        SizedBox(height: 16),
        GestureDetector(
          onTap: () {
        customNavigatepushReplacement(context, AppRouter.kForgetPasswordRoute);
          },
          child: ForgotPassword(),
        ),
      ],
    );
  }
}