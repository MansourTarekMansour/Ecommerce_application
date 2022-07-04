import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/login/login_model.dart';
import 'package:man_shop_app/data/repositories/authentication/login_repository/login_repository.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitialState());

  LoginModel? loginModel;
  LoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;
  User? user;

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      final login =
          await loginRepository.login(email: email, password: password);

      emit(LoginSuccessState(login.message));
    } catch (e, s) {
      log('error in userLogin', error: e, stackTrace: s);
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        userLogin(email: user!.email.toString(), password: googleAccount.id);
        log(user!.email.toString());
        log(googleAccount.id.toString());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
  }

  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    passwordSuffixIcon = passwordVisibility
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
