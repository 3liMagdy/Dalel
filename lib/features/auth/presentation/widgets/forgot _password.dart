import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Text(
        AppStrings.forgotPassword,
        style: CustomTextStyles.poppins600style12,
      ),
    );
  }
}
