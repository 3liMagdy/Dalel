import 'package:dalel/features/auth/presentation/widgets/custom_section_one_from.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_section_two_from.dart';
import 'package:flutter/material.dart';

class CustomSigninFrom extends StatelessWidget {
  const CustomSigninFrom({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         Custom_section_one_from(),
         Custom_section_two_feom(),
        ],
      ),
    );
  }
}



