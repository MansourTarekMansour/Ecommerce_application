import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/cubit.dart';
import 'package:man_shop_app/modules/authentication/login/bloc/states.dart';
import 'package:man_shop_app/modules/authentication/login/widgets/username_text_field.dart';
import 'package:man_shop_app/modules/authentication/register/screens/register_screen.dart';
import 'package:man_shop_app/modules/home/screens/home_screen.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/toast.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';


class LoginScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              // home screen
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token).then((
                  value) => navigateReplacement(context, const HomeScreen()),);
              if (kDebugMode) {
                print('LoginScreen: ${state.loginModel.status}');
              }
              showToast(message: state.loginModel.message,
                  state: ToastStates.SUCCESS);
            } else if (state.loginModel.status != true) {
              if (kDebugMode) {
                print('LoginScreen: ${state.loginModel.status}');
              }
              showToast(
                  message: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
        },

        builder: (BuildContext context, Object? state) {
          LoginCubit cubit = LoginCubit.get(context);
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
                        UsernameTextField(emailController: emailController),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          title: const Text(
                            'password',
                            style:
                            TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                          ),
                          hint: 'Enter your password',
                          obscureText: cubit.passwordVisibility,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: Icon(cubit.passwordSuffixIcon),
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
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
                                  builder: (context) => RegisterScreen(),
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