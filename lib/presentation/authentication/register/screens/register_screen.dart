import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
import 'package:man_shop_app/presentation/authentication/register/widgets/register_text_form.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/screens/Bottom_nav_bar_screen.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          navigateReplacement(context, const BottomNavigationBarScreen());
          showToast(message: state.message, state: ToastStates.SUCCESS);
        } else if (state is RegisterErrorState) {
          showToast(message: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        RegisterCubit registerCubit = RegisterCubit.get(context);
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
                      const SizedBox(height: 50.0),
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      RegisterTextForm(),
                      const SizedBox(height: 40.0),
                      CustomButton(
                        text: 'REGISTER',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registerCubit.register(
                              name: registerCubit.firstNameController.text
                              + registerCubit.lastNameController.text,
                              email: registerCubit.emailController.text,
                              phone: registerCubit.phoneController.text,
                              password: registerCubit.passwordController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'if you have an account just',
                          style: TextStyle(
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
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
