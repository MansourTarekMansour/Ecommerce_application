import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:man_shop_app/presentation/profile/screens/user_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(
                  color: AppColors.mainColor.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 18,),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.3, color: AppColors.mainColor),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                height: 90,
                width: 90,
                child:
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                    profileCubit.profileModel.image,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 90,
                      width: 90,
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
          Positioned(
            left: 120,
            top: 57,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    profileCubit.profileModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 160,
                  child: Text(
                    profileCubit.profileModel.phone,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 67,
            child: SvgPicture.asset(
              'assets/images/back_arrow.svg',
              color: AppColors.mainColor,
              fit: BoxFit.fitWidth,
              height: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 18,),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const SizedBox(
                  height: 90,
                  width: 90,
                  child: ClipOval(
                    child: SizedBox(),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
