import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/shared/components/add_photo_dialog.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_text_field.dart';

class AddAddressScreen extends StatelessWidget {
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
                'Add address',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            actions: const [SizedBox(width: 50)],
          ),
          body: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              if (state is AddressAddSuccessState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              final addressCubit = BlocProvider.of<AddressCubit>(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: addressCubit.nameController,
                              title: const Text(
                                'Name*',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hintTopHeight: 15,
                              keyboardType: TextInputType.name,
                              hintLeftHeight: 20,
                              boxHeight: 50,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter address name';
                                }
                                return null;
                              },

                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: addressCubit.cityController,
                              title: const Text(
                                'City*',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hintTopHeight: 15,
                              keyboardType: TextInputType.name,
                              boxHeight: 50,
                              hintLeftHeight: 20,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter city';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: addressCubit.regionController,
                              title: const Text(
                                'Region*',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hintTopHeight: 15,
                              keyboardType: TextInputType.name,
                              boxHeight: 50,
                              hintLeftHeight: 20,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter address region';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: addressCubit.detailsController,
                              title: const Text(
                                'Details*',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hintTopHeight: 15,
                              hintLeftHeight: 20,
                              keyboardType: TextInputType.name,
                              boxHeight: 50,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter address details';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: addressCubit.notesController,
                              title: const Text(
                                'Notes',
                                style: TextStyle(
                                    color: Color.fromRGBO(96, 96, 96, 1)),
                              ),
                              hintTopHeight: 15,
                              hintLeftHeight: 20,
                              keyboardType: TextInputType.name,
                              boxHeight: 50,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ConditionalBuilder(
                        condition: state is! AddressLoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addressCubit.addAddress();
                            }
                          },
                          text: 'ADD',
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
