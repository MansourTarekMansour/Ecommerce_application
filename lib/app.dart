import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/app_routes.dart';
import 'package:man_shop_app/config/themes/app_themes.dart';
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/data/repositories/authentication/logout_repository/logout_repository.dart';
import 'package:man_shop_app/data/repositories/authentication/register_repository/register_repository.dart';
import 'package:man_shop_app/data/repositories/cart/cart_repository.dart';
import 'package:man_shop_app/data/repositories/favorites/favorites_repository.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/data/web_service/authentication/login_web_service.dart';
import 'package:man_shop_app/data/web_service/authentication/logout_web_service.dart';
import 'package:man_shop_app/data/web_service/authentication/register_web_service.dart';
import 'package:man_shop_app/data/web_service/cart/cart_web_service.dart';
import 'package:man_shop_app/data/web_service/favorites/favorites_web_service.dart';
import 'package:man_shop_app/data/web_service/home/home_web_service.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/logout/bloc/logout_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/screens/Bottom_nav_bar_screen.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/presentation/favorites/bloc/favorites_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/on_boarding/screens/on_boarding_screen.dart';
import 'data/repositories/authentication/login_repository/login_repository.dart';

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  final bool onBoarding;
  final String token;

  const MyApp(
      {Key? key,
      required this.appRoutes,
      required this.onBoarding,
      required this.token,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
    ),);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginCubit(
                  LoginRepository(LoginWebService()),
                ),),
        BlocProvider(
            create: (context) =>
                RegisterCubit(RegisterRepository(RegisterWebService())),),
        BlocProvider(
            create: (context) =>
                LogoutCubit(LogoutRepository(LogoutWebService())),),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(
            create: (context) =>
                HomeCubit(HomeRepository(HomeWebService()))..getHomeData(),),
        BlocProvider(
            create: (context) =>
                FavoritesCubit(FavoritesRepository(FavoritesWebService()))..onRefresh(),),
        BlocProvider(
            create: (context) =>
            CartCubit(CartRepository(CartWebService()))..getCartData(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: appRoutes.generateRoutes,
        theme: appTheme(),
        home: onBoarding
            ? token.isEmpty
                ? LoginScreen()
                : const BottomNavigationBarScreen()
            : OnBoardingScreen(),
      ),
    );
  }
}
