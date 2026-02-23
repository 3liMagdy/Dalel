import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerSignIn extends StatelessWidget {
  const BannerSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final double hight = MediaQuery.of(context).size.height;
    print(hight * 0.28505774278);
    return Container(
      height: hight * 0.28505774278,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.appName, style: CustomTextStyles.saira700style32),
          SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.vector1),
              SvgPicture.asset(AppAssets.vector2),
            ],
          ),
        ],
      ),
    );
  }
}
