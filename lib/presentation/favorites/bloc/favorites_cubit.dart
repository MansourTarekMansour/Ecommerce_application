import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/Favorites/favorites_model.dart';
import 'package:man_shop_app/data/repositories/favorites/favorites_repository.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());

  FavoritesRepository favoritesRepository;
  late FavoritesModel favoritesModel;

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    try {
      favoritesModel = await favoritesRepository.getFavorites();
      log('mansour $favoritesModel');
      emit(FavoritesSuccess());
    } catch (e, s) {
      log('getFavorites error', error: e, stackTrace: s);
      emit(FavoritesError(e.toString()));
    }
  }
}
