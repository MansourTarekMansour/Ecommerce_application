import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/data/repositories/authentication/login_repository/login_repository.dart';
import 'package:man_shop_app/data/repositories/authentication/register_repository/register_repository.dart';
import 'package:man_shop_app/data/web_service/authentication/login_web_service.dart';
import 'package:man_shop_app/data/web_service/authentication/register_web_service.dart';
import 'package:man_shop_app/data/web_service/home/home_web_service.dart';
import 'package:man_shop_app/features/home/data/repositories/home_repository.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/screens/register_screen.dart';

class AppRoutes {
  // user data
  //late UserPrefs userPrefs;

  //Login
  late LoginRepository loginRepository;
  late LoginWebService loginWebService;

  //Register
  late RegisterRepository registerRepository;
  late RegisterWebService registerWebService;

  //Login
  late HomeRepository homeRepository;
  late HomeWebService homeWebService;

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

    }
    return null;
  }
}
