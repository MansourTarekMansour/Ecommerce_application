import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/screens/Bottom_nav_bar_screen.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                      SizedBox(
                        height: 92,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hint: 'First name',
                                title: const Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 1)),
                                ),
                                controller: firstNameController,
                                keyboardType: TextInputType.name,
                                hintTopHeight: 0,
                                hintLeftHeight: 15,
                                width: 170,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'first name is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: CustomTextField(
                                hint: 'Last name',
                                title: const Text(
                                  '',
                                  style: TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 1)),
                                ),
                                controller: lastNameController,
                                keyboardType: TextInputType.name,
                                hintTopHeight: 0,
                                hintLeftHeight: 15,
                                width: 170,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'last name is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //const SizedBox(height: 20.0),
                      CustomTextField(
                        hint: 'Enter your Email',
                        title: const Text(
                          'Email',
                          style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintTopHeight: 15,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextField(
                        hint: 'Enter your Phone number',
                        title: const Text(
                          'Phone',
                          style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        hintTopHeight: 15,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'phone number is empty';
                          } else if (value.length != 11) {
                            return 'phone number should be 11 digits';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextField(
                        hint: 'Enter password',
                        title: const Text(
                          'Password',
                          style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: registerCubit.passwordVisibility,
                        hintTopHeight: 15,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            registerCubit.changePasswordVisibility();
                          },
                          icon: Icon(registerCubit.passwordSuffixIcon),
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password is empty';
                          } else if (value.length < 6) {
                            return 'password is too short';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        hint: 'Confirm password',
                        controller: confirmPasswordController,
                        obscureText: registerCubit.confirmPasswordVisibility,
                        keyboardType: TextInputType.visiblePassword,
                        hintTopHeight: 15,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            registerCubit.changeConfirmPasswordVisibility();
                          },
                          icon: Icon(registerCubit.confirmPasswordSuffixIcon),
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password is empty';
                          } else if (value !=
                              passwordController.text) {
                            return 'confirm password is wrong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40.0),
                      CustomButton(
                        text: 'REGISTER',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registerCubit.register(
                              name: firstNameController.text
                              + lastNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
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
