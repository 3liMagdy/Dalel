

import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSectionText extends StatelessWidget {
  const CustomSectionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
         Text(
               "Explore The history with Dalel in a smart way",
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
               "Using our app’s history libraries you can find many historical periods ",
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
    ],);
  }
}