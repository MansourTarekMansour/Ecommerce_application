import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/presentation/authentication/logout/bloc/logout_cubit.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/components/toast.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoutCubit = BlocProvider.of<LogoutCubit>(context);
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          navigateReplacement(context, LoginScreen());
        }
        if (state is LogoutShowToastState) {
          showToast(message: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LogoutLoadingState,
          builder: (context) => CustomButton(
            text: 'Logout',
            buttonColor: AppColors.mainColor,
            textColor: Colors.white,
            onPressed: () {
              BlocProvider.of<BottomNavigationBarCubit>(context).changeBottom(0);
              logoutCubit.userLogout();
            },
          ),
          fallback: (context) => Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadiusDirectional.all(Radius.circular(15)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: AppColors.mainColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
