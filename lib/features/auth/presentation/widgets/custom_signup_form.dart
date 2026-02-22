

import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';

class CustomSignUpForm  extends StatelessWidget {
  const CustomSignUpForm ({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
          
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                 
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                 
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {},
                   ),
              const TermsAndConditionWidget(),
              const SizedBox(height: 88),
              CustomBtn(
                      onPressed: () {},
                      text: AppStrings.signUp,
                      ),
              ],
          ),
        ); 

  }
}