import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
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
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hint: 'First name',
                                title: const Text(
                                  'Name',
                                  style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                                ),
                                controller: firstNameController,
                                keyboardType: TextInputType.name,
                                hintTopHeight: 0,
                                hintLeftHeight: 15,
                                width: 170,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: CustomTextField(
                                hint: 'Last name',
                                title: const Text(
                                  '',
                                  style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                                ),
                                controller: lastNameController,
                                keyboardType: TextInputType.name,
                                hintTopHeight: 0,
                                hintLeftHeight: 15,
                                width: 170,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
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
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          hint: 'Enter your Phone number',
                          title: const Text(
                            'Phone',
                            style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
                          ),
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          hintTopHeight: 15,
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
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
                          obscureText: cubit.passwordVisibility,
                          hintTopHeight: 15,
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
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          hint: 'Confirm password',
                          controller: confirmPasswordController,
                          obscureText: cubit.confirmPasswordVisibility,
                          keyboardType: TextInputType.visiblePassword,
                          hintTopHeight: 15,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromRGBO(96, 96, 96, 1),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeConfirmPasswordVisibility();
                            },
                            icon: Icon(cubit.confirmPasswordSuffixIcon),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        CustomButton(
                          text: 'REGISTER',
                          onPressed: () {},
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
            );
          },
        ));
  }
}
