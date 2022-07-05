import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_states.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class RegisterTextForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Column(
          children: [
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
                      controller: registerCubit.firstNameController,
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
                      controller: registerCubit.lastNameController,
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
            CustomTextField(
              hint: 'Enter your Email',
              title: const Text(
                'Email',
                style: TextStyle(color: Color.fromRGBO(96, 96, 96, 1)),
              ),
              controller: registerCubit.emailController,
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
              controller: registerCubit.phoneController,
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
              controller: registerCubit.passwordController,
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
              controller: registerCubit.confirmPasswordController,
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
                    registerCubit.passwordController.text) {
                  return 'confirm password is wrong';
                }
                return null;
              },
            ),

          ],
        );
      },
    );
  }
}
