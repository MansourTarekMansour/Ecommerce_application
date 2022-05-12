import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/presentation/botton_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/presentation/botton_navigation_bar/bloc/states.dart';


class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bottomNavCubit = BlocProvider.of<BottomNavigationBarCubit>(context);
        return Scaffold(
          body: bottomNavCubit.bottomScreens[bottomNavCubit.currentIndex],
          bottomNavigationBar: SnakeNavigationBar.color(
            currentIndex: bottomNavCubit.currentIndex,
            onTap: (index) => bottomNavCubit.changeBottom(index),
            behaviour: SnakeBarBehaviour.pinned,
            elevation: 10.0,
            snakeShape: SnakeShape.circle,
            snakeViewColor: Colors.black,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
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
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
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
