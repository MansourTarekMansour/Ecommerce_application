import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/states.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bottomNavCubit = BlocProvider.of<BottomNavigationBarCubit>(context);
        return SafeArea(
          bottom: false,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is UserScrollNotification) {
                if (scrollNotification.direction == ScrollDirection.forward) {
                  bottomNavCubit.scrollDirection(scroll: false);
                } else if (scrollNotification.direction ==
                        ScrollDirection.reverse &&
                    scrollNotification.metrics.pixels >= 0) {
                  bottomNavCubit.scrollDirection(scroll: true);
                }
              }
              return false;
            },
            child: Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: bottomNavCubit.pages[bottomNavCubit.currentIndex],
                  ),
                  Visibility(
                    // visible: !bottomNavCubit.scrollDown &&
                    //     bottomNavCubit.currentIndex == 0,
                    child: Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        //height: 70,
                        color: Colors.white,
                        child: bottomNavCubit.appbars[bottomNavCubit.currentIndex],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !bottomNavCubit.scrollDown,
                    child: Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SnakeNavigationBar.color(
                        currentIndex: bottomNavCubit.currentIndex,
                        onTap: (index) => bottomNavCubit.changeBottom(index),
                        behaviour: SnakeBarBehaviour.pinned,
                        elevation: 10.0,
                        snakeShape: SnakeShape.indicator,
                        snakeViewColor: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: AppColors.mainColor,
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
                              'assets/icons/order.svg',
                              width: 25,
                              color: bottomNavCubit.orderIconColor,
                            ),
                            label: 'Order',
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
