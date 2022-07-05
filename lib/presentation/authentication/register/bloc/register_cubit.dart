import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/repositories/authentication/register_repository/register_repository.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(this.registerRepository) : super(RegisterInitialState());
  // to take object from cubit
  static RegisterCubit get(context) => BlocProvider.of(context);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;

  final RegisterRepository registerRepository;

  Future<void> register({
  required String name,
  required String email,
  required String password,
  required String phone,

}) async {
    emit(RegisterLoadingState());
    try {
      final String message = await registerRepository.userRegister(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      emit(RegisterSuccessState(message));
    } catch (error, s) {
      log('user register',error: error, stackTrace: s);
      emit(RegisterErrorState(error.toString()));
    }
  }
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