


import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DsecirbtionForgotPassword extends StatelessWidget {
  const DsecirbtionForgotPassword(
      {super.key, required this.text1,  });
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: text1, style: CustomTextStyles.poppins400style12.copyWith(fontSize: 14)),
      
      ]), textAlign: TextAlign.center),
    );
  }
}