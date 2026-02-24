import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/dsecirbtion_forgot_password.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class Custom_Section_One_Forgot_Password extends StatelessWidget {
  const Custom_Section_One_Forgot_Password({super.key});

  @override
  Widget build(BuildContext context) {
    final double hight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: hight * 0.1417),
        WelcomeTextWidget(
          text: AppStrings.forgotPassword,
          style: CustomTextStyles.poppins600style28.copyWith(fontSize: 24),
        ),
        SizedBox(height: 40),
        Container(
          height: hight * 0.30839895,
          width: width * 0.626666667,

          child: Image.asset(AppAssets.forgotPassword, fit: BoxFit.fill),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DsecirbtionForgotPassword(
            text1: AppStrings.descriptionForgotPassword1,
          ),
        ),
        SizedBox(height: 24),
        CustomTextFormField(
          labelText: AppStrings.emailAddress,
          onChanged: (value) {},
          onFieldSubmitted: (value) {},
        ),
      ],
    );
  }
}
