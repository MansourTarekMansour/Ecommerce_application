import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      children: [
        CustomTextField(
          controller: loginCubit.emailController,
          title: const Text(
            'Email',
            style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
          ),
          hint: 'Enter your email',
          hintTopHeight: 15,
          keyboardType: TextInputType.emailAddress,
          validate: (value) {
            if (value!.isEmpty) {
              return 'please enter your email address';
            }
            return null;
          },
          prefixIcon: const Icon(
            Icons.person,
            color: Color.fromRGBO(96, 96, 96, 1),
          ),
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          controller: loginCubit.passwordController,
          keyboardType: TextInputType.visiblePassword,
          title: const Text(
            'password',
            style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
          ),
          hint: 'Enter your password',
          obscureText: loginCubit.passwordVisibility,
          prefixIcon: const Icon(
            Icons.lock,
            color: Color.fromRGBO(96, 96, 96, 1),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              loginCubit.changePasswordVisibility();
            },
            icon: Icon(loginCubit.passwordSuffixIcon),
          ),
          validate: (value) {
            if (value!.isEmpty) {
              return 'password is empty';
            }
            else if (value.length < 6) {
              return 'password is too short';
            }
            return null;
          },
        ),
      ],
    );
  }
}
