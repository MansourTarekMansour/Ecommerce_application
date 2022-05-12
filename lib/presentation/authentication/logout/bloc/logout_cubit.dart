import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/repositories/authentication/logout_repository/logout_repository.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutRepository) : super(LogoutInitialState());

  LogoutRepository logoutRepository;

  Future<void> userLogout() async {
    emit(LogoutLoadingState());
    try {
      final logout =
      await logoutRepository.logout();
      CacheHelper.removeData(
        key: 'token',
      );
      emit(LogoutShowToastState(logout['message']));
      emit(LogoutSuccessState());
    } catch (e, s) {
      log('error in userLogout', error: e, stackTrace: s);
      emit(LogoutErrorState(e.toString()));

    }
  }
}
