import 'package:flutter/material.dart';
import 'package:man_shop_app/data/repositories/authentication/logout_repository/logout_repository.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/data/web_service/authentication/login_web_service.dart';
import 'package:man_shop_app/data/web_service/authentication/logout_web_service.dart';
import 'package:man_shop_app/data/web_service/home/home_web_service.dart';
import 'package:man_shop_app/presentation/authentication/login/bloc/login_cubit.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/logout/bloc/logout_cubit.dart';
import 'package:man_shop_app/presentation/authentication/register/bloc/register_cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/screens/Bottom_nav_bar_screen.dart';
import 'package:man_shop_app/presentation/on_boarding/screens/on_boarding_screen.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/shared/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/repositories/authentication/login_repository/login_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = await CacheHelper.getData(key: 'onBoarding') ?? false;
  AppConst.token = await CacheHelper.getData(key: 'token') ?? '';

  BlocOverrides.runZoned(
      () => runApp(MyApp(onBoarding: onBoarding, token: AppConst.token)),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  final String token;

  const MyApp({Key? key, required this.onBoarding, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginRepository(LoginWebService()),)),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LogoutCubit(LogoutRepository(LogoutWebService()))),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(create: (context) => HomeCubit(HomeRepository(HomeWebService()))..getHomeData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: onBoarding
            ? token.isEmpty
                ? LoginScreen()
                : const BottomNavigationBarScreen()
            : OnBoardingScreen(),
      ),
    );
  }
}