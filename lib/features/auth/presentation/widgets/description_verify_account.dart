


import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class DescriptionVerifyAccount extends StatelessWidget {
  const DescriptionVerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 240,
      child: WelcomeTextWidget(
        text: AppStrings.enter4DigitCodeWeHaveSentTo,
        alignment: Alignment.center,
        style: CustomTextStyles.poppins400style12.copyWith(
          color: AppColors.deepGrey,
          fontSize: 14,
        ),
      ),
    );
  }
}