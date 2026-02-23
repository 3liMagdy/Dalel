

import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In View'),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.login),
          iconSize: 100,
          color: Colors.blue,
          onPressed: (){
            customNavigatepushReplacement(context, AppRouter.kSignUpRoute);
          },
      ),
    ));
  }
}