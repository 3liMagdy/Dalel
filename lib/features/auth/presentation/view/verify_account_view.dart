import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = 16 * 2; // لأن في يمين وشمال
    final fieldSpacing = 12 * 3; // 4 مربعات = 3 مسافات بينهم

    final fieldWidth = (screenWidth - horizontalPadding - fieldSpacing) / 4;

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.12),

              /// Title
              WelcomeTextWidget(
                text: AppStrings.verifyAccount,
                style: CustomTextStyles.poppins600style28.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),

              /// Description

              SizedBox(
                height: 48,
                width: 240,
                child: WelcomeTextWidget(
                  text: AppStrings.enter4DigitCodeWeHaveSentTo,
                  alignment: Alignment.center,
                  style: CustomTextStyles.poppins400style12.copyWith(
                    color: Color(0xff6F6460),
                    fontSize: 14,
                    
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// OTP
              Pinput(
                length: 4,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  width: fieldWidth,
                  height: 60,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                separatorBuilder: (index) => const SizedBox(width: 12),
                focusedPinTheme: PinTheme(
                  width: fieldWidth,
                  height: 60,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onCompleted: (pin) {
                  debugPrint(pin);
                },
              ),

              const SizedBox(height: 40),

              /// Resend text
              const Text(
                "Haven’t received verification code?",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  // resend logic
                },
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
