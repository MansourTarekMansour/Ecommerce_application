import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/shared/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';
import 'modules/authentication/login/bloc/cubit.dart';
import 'modules/on_boarding/screens/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
          LoginCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', ''),
      // ],
      home: OnBoardingScreen(),
    );
  }
}

