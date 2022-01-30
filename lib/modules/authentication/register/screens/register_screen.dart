import 'package:flutter/material.dart';
import 'package:man_shop_app/modules/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';
import 'package:man_shop_app/shared/components/google_facebook_login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  hint: 'Enter your Number',
                  keyboardType: TextInputType.number,
                  hintTopHeight: 15,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Color.fromRGBO(96, 96, 96, 1),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  hint: 'Enter your Email',
                  keyboardType: TextInputType.emailAddress,
                  hintTopHeight: 15,
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Color.fromRGBO(96, 96, 96, 1),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  hint: 'Enter password',
                  obscureText: true,
                  hintTopHeight: 15,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromRGBO(96, 96, 96, 1),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  hint: 'Confirm password',
                  obscureText: true,
                  hintTopHeight: 15,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromRGBO(96, 96, 96, 1),
                  ),
                ),
                const SizedBox(height: 40.0),
                CustomButton(
                  text: 'REGISTER',
                  onPressed: () {},
                ),
                const SizedBox(height: 25.0),
                const Text(
                  'OR',
                  style: TextStyle(
                    color: Color.fromRGBO(96, 96, 96, 0.5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25.0),
                const GoogleFacebookLogin(),
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
                        builder: (context) =>  LoginScreen(),
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
  }
}
