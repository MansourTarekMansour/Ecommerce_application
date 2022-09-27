import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
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
                  child: Column(
                    children: [
                      const UserProfileCard(),
                      const SizedBox(height: 15),
                      Divider(color: AppColors.mainColor),
                      const SizedBox(height: 15),
                      ProfileIconTextCard(
                        text: 'Your points',
                        hint: profileCubit.profileModel.points.toString(),
                        iconPath: 'assets/icons/crown.svg',
                      ),
                      const SizedBox(height: 10),
                      ProfileIconTextCard(
                        text: 'Your cash wallet',
                        hint: profileCubit.profileModel.credit.toString(),
                        iconPath: 'assets/icons/wallet.svg',
                        iconWidth: 50,
                      ),
                      const SizedBox(height: 15),
                      Divider(color: AppColors.mainColor),
                      const SizedBox(height: 15),
                      const LogoutButton(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
