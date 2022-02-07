import 'package:flutter/material.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController emailController;
  UsernameTextField({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
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
    );
  }
}
