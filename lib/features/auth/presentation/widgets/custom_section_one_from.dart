import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot%20_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custom_section_one_from extends StatelessWidget {
  Custom_section_one_from({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  context.read<AuthCubit>().emailAddress = email;
                },
              ),
              SizedBox(height: 16),
            CustomTextFormField(
              labelText: AppStrings.password,
              obscureText: state.isPasswordValid,
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
              onChanged: (password) {
                context.read<AuthCubit>().password = password;
              },
              onFieldSubmitted: (value) {
                 context.read<AuthCubit>().signInWithEmailAndPassword();
              },
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
               customNavigate(
                  context,
                  AppRouter.kForgetPasswordRoute,
                );
              },
              child: ForgotPassword(),
            ),
          ],

          );
        },
      );
  }
}
