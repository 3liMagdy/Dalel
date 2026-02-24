part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isTermsAccepted;
  final bool isPasswordValid;
  final bool isOtpComplete;
  final bool isVerificationEmailSent;

  const AuthState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isTermsAccepted = false,
    this.isPasswordValid = false,
    this.isOtpComplete = false,
    this.isVerificationEmailSent = false,
  });

AuthState copyWith({
  bool? isLoading,
  bool? isSuccess,
  String? errorMessage,
  bool? isTermsAccepted,
  bool? isPasswordValid,
  bool? isOtpComplete,
  bool? isVerificationEmailSent,
}) {
  return AuthState(
    isLoading: isLoading ?? this.isLoading,
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
    isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    isOtpComplete: isOtpComplete ?? this.isOtpComplete,
    isVerificationEmailSent: isVerificationEmailSent ?? this.isVerificationEmailSent,
  );
}

  @override
  List<Object?> get props =>
      [isLoading, isSuccess, errorMessage, isTermsAccepted, isPasswordValid, isOtpComplete, isVerificationEmailSent];
}