import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;






  void signUpWithEmailAndPassword()async{
      try {
        emit(AuthLoading());
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
               email: emailAddress!,
               password: password!,
  );
  emit(AuthSuccess());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(AuthFailure(errorMessage: 'The password provided is too weak.')); 
   
  } else if (e.code == 'email-already-in-use') {
    emit(AuthFailure(errorMessage: 'Email already in use.'));
  }
} catch (e) {
  emit(AuthFailure(errorMessage: e.toString()));
  
}

  }

}
