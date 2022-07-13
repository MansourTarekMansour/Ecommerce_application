import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/app.dart';
import 'package:man_shop_app/config/routes/app_routes.dart';
import 'package:man_shop_app/shared/bloc_observer.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = await CacheHelper.getData(key: 'onBoarding') ?? false;
  AppConst.token = await CacheHelper.getData(key: 'token') ?? '';

  BlocOverrides.runZoned(
      () => runApp(MyApp(
          appRoutes: AppRoutes(),
          onBoarding: onBoarding,
          token: AppConst.token)),
      blocObserver: MyBlocObserver());
}
