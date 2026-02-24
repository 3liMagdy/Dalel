import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
 

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  // --------------------------
  // Checkbox Update
  // --------------------------

  void updateTermsAndConditionCheckBox({required bool newValue}) {
    emit(state.copyWith(isTermsAccepted: newValue));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordValid: !state.isPasswordValid));
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  // --------------------------
  // Sign Up
  // --------------------------

  Future<void> signUpWithEmailAndPassword() async {
    if (!state.isTermsAccepted) {
      emit(
        state.copyWith(errorMessage: "You must accept terms and conditions."),
      );
      return;
    }

    if (emailAddress == null || password == null) {
      emit(state.copyWith(errorMessage: 'Email and password are required.'));
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!,
      );

      // After creating the account, send verification email and await it.
      final sent = await _sendVerificationEmailForUser(cred.user ?? FirebaseAuth.instance.currentUser);

      if (!sent) {
        emit(state.copyWith(isLoading: false, isSuccess: false, errorMessage: 'Failed to send verification email.'));
        return;
      }

      debugPrint('Sign up complete and verification email sent for ${emailAddress!.trim()}');
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Email already in use.',
          ),
        );
      }else if(e.code == 'Invalid-email'){
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'The email address is not valid.',
          ),
        );
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: e.message));

      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    if (emailAddress == null ||
        password == null ||
        emailAddress!.trim().isEmpty ||
        password!.trim().isEmpty) {
      emit(state.copyWith(errorMessage: "Email and password are required"));
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
     
      if (e.code == 'user-not-found') {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'No user found for that email.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Wrong password provided for that user.',
          ),
        );
      }else{
        emit(state.copyWith(isLoading: false, errorMessage: "Check your email and password and try again."));
      }
    } catch (e) {
     
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }


  void updateOtpStatus(bool isComplete) {
  emit(state.copyWith(isOtpComplete: isComplete));
}


  Future<void> verifyEmail() async {
    // kept for backward compatibility but delegate to safer implementation
    await _sendVerificationEmailForUser(FirebaseAuth.instance.currentUser);
  }

  Future<bool> _sendVerificationEmailForUser(User? user) async {
    if (user == null) {
      debugPrint('Verification: no user available to send verification.');
      emit(state.copyWith(errorMessage: 'No authenticated user found.', isVerificationEmailSent: false));
      return false;
    }

    try {
      debugPrint('Sending verification email to ${user.email}');
      await user.sendEmailVerification();
      debugPrint('Verification email successfully sent to ${user.email}');
      emit(state.copyWith(errorMessage: null, isVerificationEmailSent: true));
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException while sending verification: ${e.message}');
      emit(state.copyWith(errorMessage: e.message, isVerificationEmailSent: false));
      return false;
    } catch (e) {
      debugPrint('Unexpected error while sending verification: $e');
      emit(state.copyWith(errorMessage: e.toString(), isVerificationEmailSent: false));
      return false;
    }
  }

  /// Reloads current user from Firebase and returns latest `emailVerified`.
  Future<bool> reloadAndCheckEmailVerified() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        debugPrint('reloadAndCheckEmailVerified: no current user');
        return false;
      }

      await user.reload();
      final reloaded = FirebaseAuth.instance.currentUser;
      final verified = reloaded?.emailVerified ?? false;
      debugPrint('Email verified after reload: $verified');
      return verified;
    } catch (e) {
      debugPrint('Error reloading user: $e');
      emit(state.copyWith(errorMessage: e.toString()));
      return false;
    }
  }
}
