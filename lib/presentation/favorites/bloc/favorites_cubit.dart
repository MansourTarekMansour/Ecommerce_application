import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/Favorites/favorites_model.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/favorites/favorites_repository.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());

  FavoritesRepository favoritesRepository;
  late FavoritesModel favoritesModel;
  late List<bool> notFavorite;
  late List<Products> products = [];
  final refreshController = RefreshController();

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    try {
      favoritesModel = await favoritesRepository.getFavorites();
      for(int i = 0; i < favoritesModel.data.length; i++){
        products.add(favoritesModel.data[i].product);
      }
      log('mansour $favoritesModel');
      notFavorite = List.generate(favoritesModel.data.length, (index) {
        return false;
      });
      emit(FavoritesSuccess());
    } catch (e, s) {
      log('getFavorites error', error: e, stackTrace: s);
      emit(FavoritesError(e.toString()));
    }
  }

  // Future<void> onLoading() async {
  //   await getFavorites();
  //   refreshController.loadComplete();
  // }

  Future<void> onRefresh() async {
    emit(FavoritesLoading());
    products.clear();
    await getFavorites();
    refreshController.refreshCompleted();
  }

  Future<void> isFavorite(int index) async {
    notFavorite[index] = !notFavorite[index];
    emit(FavoritesSuccess());
  }
}
