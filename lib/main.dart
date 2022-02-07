import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/modules/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/modules/home/bloc/cubit.dart';
import 'package:man_shop_app/modules/home/bloc/states.dart';
import 'package:man_shop_app/modules/home/screens/home_screen.dart';
import 'package:man_shop_app/shared/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';
import 'modules/on_boarding/screens/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = await CacheHelper.getData(key: 'onBoarding') ?? false;
  String token = await CacheHelper.getData(key: 'token') ?? '';

  BlocOverrides.runZoned(
          () => runApp(MyApp(onBoarding: onBoarding, token: token)),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  final String token;

  MyApp({required this.onBoarding, required this.token});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

    ],
      child: BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: onBoarding
              ? token.isEmpty
              ? LoginScreen()
              : const HomeScreen()
              : OnBoardingScreen(),
        );
      },
    ),);
  }
}
