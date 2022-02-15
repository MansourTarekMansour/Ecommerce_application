import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:man_shop_app/models/login/LoginModel.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  // to take object from cubit
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  Future<void> userLogin({required String email, required String password})async{
    emit(LoginLoadingState());
    try {
     final response = await DioHelper.postData(url: login, data: {
        'email': email,
        'password': password,
      });
        loginModel =  LoginModel.fromJson(response?.data);
        log('State: ${loginModel!.status}');
        // log(loginModel!.message);
        // log(loginModel!.data!.token);
        emit(LoginSuccessState(loginModel!));

    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      emit(LoginErrorState(e.toString()));
    }
  }



  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;
  void changePasswordVisibility(){
    passwordVisibility = !passwordVisibility;
    passwordSuffixIcon = passwordVisibility? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

}