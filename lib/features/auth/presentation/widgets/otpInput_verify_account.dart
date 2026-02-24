


import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInputVerifyAccount extends StatelessWidget {
  const OtpInputVerifyAccount({
    required this.length,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.separatorWidth,
    required this.onCompleted,
  });

  final int length;
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final double separatorWidth;
  final void Function(String) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      separatorBuilder: (_) => SizedBox(width: separatorWidth),
      onChanged: onCompleted,
    );
  }
}