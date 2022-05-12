import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
  // to take object from cubit
  static RegisterCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;
  void changePasswordVisibility(){
    passwordVisibility = !passwordVisibility;
    passwordSuffixIcon = passwordVisibility? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  bool confirmPasswordVisibility = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility_outlined;
  void changeConfirmPasswordVisibility(){
    confirmPasswordVisibility = ! confirmPasswordVisibility;
    confirmPasswordSuffixIcon = confirmPasswordVisibility? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangeConfirmPasswordVisibilityState());
  }

}