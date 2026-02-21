   

import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: CustomBtn(text: AppStrings.next, onPressed: (){},),
        );
  }
}