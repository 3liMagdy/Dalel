
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            customNavigatepushReplacement(context, AppRouter.kSignInRoute);
          }, icon: const Icon(Icons.logout),
      ),),
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}