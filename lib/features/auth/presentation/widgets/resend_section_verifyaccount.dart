

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:flutter/material.dart';

class ResendSectionVerifyaccount extends StatelessWidget {
  const ResendSectionVerifyaccount({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         AppStrings.haventReceivedVerificationCode,
          style: CustomTextStyles.poppins400style12.copyWith(
            color: AppColors.deepGrey,
            fontSize: 14,
          ) ,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // resend logic
          },
          child: Text(
            AppStrings.resendCode,
            style: CustomTextStyles.poppins400style12.copyWith(
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

