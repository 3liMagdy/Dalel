part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isTermsAccepted;
  final bool isPasswordValid;

  const AuthState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isTermsAccepted = false,
    this.isPasswordValid = false,
  });

AuthState copyWith({
  bool? isLoading,
  bool? isSuccess,
  String? errorMessage,
  bool? isTermsAccepted,
  bool? isPasswordValid,
}) {
  return AuthState(
    isLoading: isLoading ?? this.isLoading,
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
    isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    isPasswordValid: isPasswordValid ?? this.isPasswordValid,
  );
}

  @override
  List<Object?> get props =>
      [isLoading, isSuccess, errorMessage, isTermsAccepted, isPasswordValid];
}