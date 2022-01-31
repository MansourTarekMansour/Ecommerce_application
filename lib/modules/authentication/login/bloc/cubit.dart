import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  // to take object from cubit
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}){
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    })!.then((value){
      print(value!.data);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;
  void changePasswordVisibility(){
    passwordVisibility = !passwordVisibility;
    passwordSuffixIcon = passwordVisibility? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

}