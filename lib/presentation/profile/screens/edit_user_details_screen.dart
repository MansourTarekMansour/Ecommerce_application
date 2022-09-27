import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/shared/components/add_photo_dialog.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class EditUserDetailsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200]?.withOpacity(0.7),
                ),
                // ignore: deprecated_member_use
                child: MaterialButton(
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: Colors.transparent,
                  onPressed: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/images/left_arrow.svg',
                    color: AppColors.mainColor,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Center(
              child: Text(
                'Edit',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            actions: const [SizedBox(width: 50)],
          ),
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdateSuccessState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              final profileCubit = BlocProvider.of<ProfileCubit>(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.3,
                            color: AppColors.mainColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    AddPhotoDialog(
                                  onPressedCamera: () async {
                                    profileCubit.getImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                  onPressedGallery: () async {
                                    profileCubit.getImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: profileCubit.mainImage == null
                                      ? Image.network(
                                          profileCubit.imageProfile!,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120,
                                          //color: Colors.white,
                                        )
                                      : Image.file(
                                          profileCubit.mainImage!,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120,
                                          //color: Colors.white,
                                        ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    width: 120,
                                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/edit_user_details.svg',
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: profileCubit.nameController,
                              title: const Text(
                                'Name',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hint: 'Enter your name',
                              hintTopHeight: 15,
                              keyboardType: TextInputType.name,
                              boxHeight: 50,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: profileCubit.numberController,
                              title: const Text(
                                'Phone number',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hint: 'Enter your phone number',
                              hintTopHeight: 15,
                              keyboardType: TextInputType.phone,
                              boxHeight: 50,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your phone number';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: profileCubit.emailController,
                              title: const Text(
                                'Email',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hint: 'Enter your email',
                              hintTopHeight: 15,
                              keyboardType: TextInputType.emailAddress,
                              boxHeight: 50,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter email';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hint: 'Enter password',
                              title: const Text(
                                'Password',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              controller: profileCubit.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: profileCubit.passwordVisibility,
                              hintTopHeight: 15,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  profileCubit.changePasswordVisibility();
                                },
                                icon: Icon(profileCubit.passwordSuffixIcon),
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
                            const SizedBox(height: 20.0),
                            CustomTextField(
                              hint: 'Confirm password',
                              controller:
                                  profileCubit.confirmPasswordController,
                              obscureText:
                                  profileCubit.confirmPasswordVisibility,
                              keyboardType: TextInputType.visiblePassword,
                              hintTopHeight: 15,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  profileCubit
                                      .changeConfirmPasswordVisibility();
                                },
                                icon: Icon(
                                    profileCubit.confirmPasswordSuffixIcon),
                              ),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password is empty';
                                } else if (value !=
                                    profileCubit.passwordController.text) {
                                  return 'confirm password is wrong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      ConditionalBuilder(
                        condition: state is! ProfileLoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              profileCubit.updateUserData();
                            }
                          },
                          text: 'SAVE',
                          width: MediaQuery.of(context).size.width * 0.95,
                          buttonColor: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                        fallback: (context) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: const BorderRadiusDirectional.all(
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
