import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/screens/address_screen.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/presentation/profile/screens/edit_user_details_screen.dart';
import 'package:man_shop_app/presentation/profile/widgets/profile_icon_text_button_card.dart';
import 'package:man_shop_app/presentation/profile/widgets/profile_text_field.dart';
import 'package:man_shop_app/shared/components/text_class.dart';
import 'package:shimmer/shimmer.dart';

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
            actions: const [
               SizedBox(width: 50),
            ],
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final profileCubit = BlocProvider.of<ProfileCubit>(context);
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 0.1, color: Colors.grey),
                      ),
                    ),
                    child: Column(
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
                                child: CachedNetworkImage(
                                  imageUrl:
                                  profileCubit.profileModel.image,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[100]!,
                                    highlightColor: Colors.grey[200]!,
                                    child:
                                    Image.asset('assets/images/almansoury_text.png'),
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ProfileTextField(
                          text: profileCubit.profileModel.phone,
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 15),
                        ProfileTextField(
                          text: profileCubit.profileModel.email,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 15),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 15),
                        ProfileIconTextButtonCard(
                          text: 'Edit Profile',
                          hint: 'Tap to edit your information',
                          iconPath: 'assets/icons/edit_profile.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditUserDetailsScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ProfileIconTextButtonCard(
                          text: 'Addresses',
                          hint: 'Tap to view addresses and edit it',
                          iconPath: 'assets/icons/edit_address.svg',
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AddressScreen()),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
