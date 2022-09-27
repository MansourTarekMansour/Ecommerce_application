import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/presentation/profile/screens/edit_user_details_screen.dart';
import 'package:man_shop_app/presentation/profile/widgets/profile_text_field.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/text_class.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
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
              child:Text(
                'Profile',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  iconSize: 28,
                  color: Colors.black,
                  icon: SvgPicture.asset('assets/icons/edit_user_details.svg'),
                  onPressed: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditUserDetailsScreen()),
                      ),
                ),
              ),
            ],
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final profileCubit = BlocProvider.of<ProfileCubit>(context);
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.3,
                                color: AppColors.mainColor
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: SizedBox(
                              width: 130,
                              height: 130,
                              child: ClipOval(
                                child: Image.network(
                                  profileCubit.profileModel.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextClass(
                          text: profileCubit.profileModel.name,
                          fontSize: 22,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(height: 20),
                        ProfileTextField(
                          text: profileCubit.profileModel.phone,
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 15),
                        ProfileTextField(
                          text: profileCubit.profileModel.email,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
