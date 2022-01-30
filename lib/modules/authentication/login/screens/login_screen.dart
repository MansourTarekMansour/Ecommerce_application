import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/cubit.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/states.dart';
import 'package:man_shop_app/modules/authentication/register/screens/register_screen.dart';
import 'package:man_shop_app/shared/components/google_facebook_login.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70.0),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextField(
                          title: const Text(
                            'username',
                            style:
                            TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                          ),
                          hint: 'Enter your username',
                          hintTopHeight: 15,
                          keyboardType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          title: const Text(
                            'password',
                            style:
                            TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                          ),
                          hint: 'Enter your password',
                          obscureText: true,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('forget password?'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) =>
                              CustomButton(
                                text: 'LOGIN',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                          fallback: (context) =>
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(64, 123, 255, 1),
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(15)),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        ),
                        const SizedBox(height: 30.0),
                        // const Text(
                        //   'OR',
                        //   style: TextStyle(
                        //     color: Color.fromRGBO(96, 96, 96, 0.5),
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // const SizedBox(height: 30.0),
                        // const GoogleFacebookLogin(),
                        const SizedBox(height: 100.0),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'if you don\'t have an account',
                            style: TextStyle(
                              color: Color.fromRGBO(96, 96, 96, 1),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        CustomButton(
                          text: 'REGISTER',
                          buttonColor: Colors.black,
                          onPressed: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
