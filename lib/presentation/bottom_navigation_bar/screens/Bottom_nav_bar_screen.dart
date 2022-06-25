import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/states.dart';
import 'package:man_shop_app/shared/styles/color.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bottomNavCubit = BlocProvider.of<BottomNavigationBarCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
            ),
          ),
          body: bottomNavCubit.bottomScreens[bottomNavCubit.currentIndex],
          bottomNavigationBar: SnakeNavigationBar.color(
            currentIndex: bottomNavCubit.currentIndex,
            onTap: (index) => bottomNavCubit.changeBottom(index),
            behaviour: SnakeBarBehaviour.pinned,
            elevation: 10.0,
            snakeShape: SnakeShape.indicator,
            snakeViewColor: iconColor,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.white,
            unselectedItemColor: iconColor,
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(30),
            //     topRight: Radius.circular(30),
            //   ),
            // ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 22,
                  color: bottomNavCubit.homeIconColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/card.svg',
                  width: 22,
                  color: bottomNavCubit.cardIconColor,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: bottomNavCubit.favoriteIconColor,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 20,
                  color: bottomNavCubit.profileIconColor,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
