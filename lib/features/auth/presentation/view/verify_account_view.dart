import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/description_verify_account.dart';
import 'package:dalel/features/auth/presentation/widgets/otpInput_verify_account.dart';
import 'package:dalel/features/auth/presentation/widgets/resend_section_verifyaccount.dart';
import 'package:dalel/features/auth/presentation/widgets/title_verify_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  static const _backgroundColor = Color(0xFFF5F5F5);
  static const double _horizontalPadding = 24.0;
  static const double _fieldHeight = 60.0;
  static const double _fieldSpacing = 12.0;
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    // 4 fields -> 3 gaps between them
    final totalGaps = _fieldSpacing * 3;
    final availableWidth = screenWidth - (_horizontalPadding * 2) - totalGaps;
    final fieldWidth = availableWidth / 4;

    final pinTextStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );

    final defaultPinTheme = PinTheme(
      width: fieldWidth,
      height: _fieldHeight,
      textStyle: pinTextStyle,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.black),
      ),
    );

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: size.height * 0.12),
                  TitleVerifyAccount(),
                  const SizedBox(height: 12),
                  const DescriptionVerifyAccount(),
                  const SizedBox(height: 40),
                  OtpInputVerifyAccount(
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    separatorWidth: _fieldSpacing,
                    onCompleted: (value) {
                      context.read<AuthCubit>().updateOtpStatus(
                        value.length == 4,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  BottomNavigateBarInVarifyAccount(
                    isButtonEnabled: state.isOtpComplete,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavigateBarInVarifyAccount extends StatelessWidget {
  BottomNavigateBarInVarifyAccount({super.key, required this.isButtonEnabled});
  bool isButtonEnabled; // This should be managed by state in a real app
  @override
  Widget build(BuildContext context) {
    return CustomBtn(
      text: AppStrings.verificationNow,
      color: isButtonEnabled
          ? null
          : AppColors.offWhite, // Disable color when not enabled
      onPressed: () {
        // Navigate to the next screen
      },
    );
  }
}
