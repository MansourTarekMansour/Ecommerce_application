import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/modules/home/bloc/cubit.dart';
import 'package:man_shop_app/modules/home/bloc/states.dart';
import 'package:man_shop_app/modules/search/screens/search_screen.dart';
import 'package:man_shop_app/shared/components/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('home'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  navigateTo(context, const SearchScreen(),);
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: SnakeNavigationBar.color(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottom(index),
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
                  color: cubit.homeIconColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/card.svg',
                  width: 22,
                  color: cubit.cardIconColor,
                ),
                label: 'Categories',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 20,
                  color: cubit.profileIconColor,
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
