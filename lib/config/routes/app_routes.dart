import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/data/repositories/authentication/login_repository/login_repository.dart';
import 'package:man_shop_app/data/repositories/authentication/register_repository/register_repository.dart';
import 'package:man_shop_app/data/repositories/cart/cart_repository.dart';
import 'package:man_shop_app/data/repositories/search/search_repository.dart';
import 'package:man_shop_app/data/web_service/authentication/login_web_service.dart';
import 'package:man_shop_app/data/web_service/authentication/register_web_service.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/data/web_service/cart/cart_web_service.dart';
import 'package:man_shop_app/data/web_service/home/home_web_service.dart';
import 'package:man_shop_app/data/web_service/search/search_web_service.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/screens/register_screen.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/presentation/cart/screens/cart_screen.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/home/screens/home_screen.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';
import 'package:man_shop_app/presentation/product_details/screens/product_details_screen.dart';
import 'package:man_shop_app/presentation/search/bloc/search_cubit.dart';
import 'package:man_shop_app/presentation/search/screens/search_screen.dart';

class AppRoutes {
  // user data
  //late UserPrefs userPrefs;

  //Login
  late LoginRepository loginRepository;
  late LoginWebService loginWebService;

  //Register
  late RegisterRepository registerRepository;
  late RegisterWebService registerWebService;

  //home
  late HomeRepository homeRepository;
  late HomeWebService homeWebService;

  //cart
  late CartRepository cartRepository;
  late CartWebService cartWebService;

  //search
  late SearchRepository searchRepository;
  late SearchWebService searchWebService;

  void initAppSettings() {
    // user data
    //userPrefs = UserPrefs();

    //Login init
    loginWebService = LoginWebService();
    loginRepository = LoginRepository(
      loginWebService,
    );

    //Register init
    registerWebService = RegisterWebService();
    registerRepository = RegisterRepository(
      registerWebService,
    );

    //Home init
    homeWebService = HomeWebService();
    homeRepository = HomeRepository(
      homeWebService,
    );
    //Cart init
    cartWebService = CartWebService();
    cartRepository = CartRepository(
      cartWebService,
    );

    //Cart init
    searchWebService = SearchWebService();
    searchRepository = SearchRepository(
      searchWebService,
    );
  }

  Route? generateRoutes(RouteSettings? settings) {
    initAppSettings();
    switch (settings!.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(
              loginRepository,
            ),
            child:  LoginScreen(),
          ),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(registerRepository),
            child: RegisterScreen(),
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(homeRepository),
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetailsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => ProductDetailsCubit(),
            child: ProductDetailsScreen(),
          ),
        );

      case Routes.cartRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => CartCubit(cartRepository),
            child: CartScreen(),
          ),
        );

      case Routes.searchRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => SearchCubit(searchRepository),
            child: SearchScreen(),
          ),
        );
    }
    return null;
  }
}
