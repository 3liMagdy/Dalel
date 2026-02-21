import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSectionText extends StatelessWidget {


  const CustomSectionText({
    super.key,  required this.title, required this.subTitle,
  });
final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
             Text(
               title,
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                subTitle,
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
      ],
    );
  }
}
