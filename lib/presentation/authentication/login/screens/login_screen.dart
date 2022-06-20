import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_states.dart';
import 'package:man_shop_app/presentation/authentication/login/widgets/login_text_fields.dart';
import 'package:man_shop_app/presentation/authentication/register/screens/register_screen.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/screens/Bottom_nav_bar_screen.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/presentation/authentication/login/widgets/google_facebook_login.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/toast.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccessState) {
          navigateReplacement(context, const BottomNavigationBarScreen());
          showToast(message: state.message, state: ToastStates.SUCCESS);
        } else if (state is LoginErrorState) {
          showToast(message: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
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
                      const LoginTextFields(),
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
                        builder: (context) => CustomButton(
                          text: 'LOGIN',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              loginCubit.userLogin(
                                email: loginCubit.emailController.text,
                                password: loginCubit.passwordController.text,
                              );
                            }
                          },
                        ),
                        fallback: (context) => Container(
                          width: MediaQuery.of(context).size.width,
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
                      const SizedBox(height: 11.0),
                      CustomButton(
                        text: 'REGISTER',
                        buttonColor: Colors.black,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const GoogleFacebookLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
