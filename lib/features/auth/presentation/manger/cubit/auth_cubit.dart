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
      emit(state.copyWith(
        errorMessage: "You must accept terms and conditions.",
      ));
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'The password provided is too weak.',
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Email already in use.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}