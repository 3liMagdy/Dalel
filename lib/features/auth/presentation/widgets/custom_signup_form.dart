import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/functions/showToast.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.isSuccess) {
          await customshowToast(AppStrings.signUpSuccess, Colors.green);
         customNavigatepushReplacement(context, AppRouter.kHomeRoute);
        } else if (state.errorMessage != null) {
          await customshowToast(state.errorMessage!, Colors.red);
           
          context.read<AuthCubit>().clearError();
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,

          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  authCubit.firstName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                obscureText: !state.isPasswordValid,
                suffixIcon: IconButton(
                  icon: Icon(
                    state.isPasswordValid
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().togglePasswordVisibility();
                  },
                ),
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndConditionWidget(),

              const SizedBox(height: 88),

              (state.isLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      color: !state.isTermsAccepted ? AppColors.grey : null,
                      onPressed: state.isTermsAccepted
                          ? () {
                              if (authCubit.signupFormKey.currentState!
                                  .validate()) {
                                authCubit.signUpWithEmailAndPassword();
                              }
                            }
                          : null,
                      text: AppStrings.signUp,
                    ),
            ],
          ),
        );
      },
    );
  }
}

