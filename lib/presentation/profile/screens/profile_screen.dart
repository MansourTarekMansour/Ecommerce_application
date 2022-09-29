import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/about_us/screens/about_us_screen.dart';
import 'package:man_shop_app/presentation/contact_us/screens/contact_us_screen.dart';
import 'package:man_shop_app/presentation/faq/screens/faq_screen.dart';
import 'package:man_shop_app/presentation/languages/screens/lanuages_screen.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/presentation/profile/widgets/profile_icon_text_button_card.dart';
import 'package:man_shop_app/presentation/profile/widgets/profile_icon_text_card.dart';
import 'package:man_shop_app/presentation/profile/widgets/user_profile_card.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';
import 'package:man_shop_app/shared/components/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final profileCubit = BlocProvider.of<ProfileCubit>(context);
          return state is ProfileLoadingState
              ? const CustomLoadingIndicator()
              : Padding(
                  padding: const EdgeInsets.all(20.0).copyWith(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const UserProfileCard(),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ProfileIconTextCard(
                              text: 'Points',
                              hint: profileCubit.profileModel.points.toString(),
                              iconPath: 'assets/icons/crown.svg',
                            ),
                            const SizedBox(width: 10),
                            ProfileIconTextCard(
                              text: 'Cash wallet',
                              hint: profileCubit.profileModel.credit.toString(),
                              iconPath: 'assets/icons/wallet.svg',
                              iconWidth: 40,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 5),
                        ProfileIconTextButtonCard(
                          text: 'Contact us',
                          hint: 'Tap to view contact information',
                          iconPath: 'assets/icons/contact.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactUsScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ProfileIconTextButtonCard(
                          text: 'About us',
                          hint: 'Terms of use',
                          iconPath: 'assets/icons/about_us.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUsScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ProfileIconTextButtonCard(
                          text: 'F A Q',
                          hint: 'Answers of popular questions',
                          iconPath: 'assets/icons/faq.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FaqScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ProfileIconTextButtonCard(
                          text: 'Languages',
                          hint: 'English',
                          iconPath: 'assets/icons/language.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LanguagesScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.grey),
                        const SizedBox(height:5),
                        const LogoutButton(),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
