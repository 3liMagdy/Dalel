


import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key, required this.text, this.style,this.alignment});
  final String text;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Text(
        text,
        style: style ?? CustomTextStyles.poppins600style28,
      ),
    );
  }
}