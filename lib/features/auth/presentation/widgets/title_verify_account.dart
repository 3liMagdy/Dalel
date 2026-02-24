

import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class TitleVerifyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeTextWidget(
      text: AppStrings.verifyAccount,
      style: CustomTextStyles.poppins600style28.copyWith(fontSize: 24),
    );
  }
}