import 'package:man_shop_app/data/models/Favorites/favorites_model.dart';
import 'package:man_shop_app/data/web_service/favorites/favorites_web_service.dart';

class FavoritesRepository {
  FavoritesRepository(this.favoritesWebService);
  FavoritesWebService favoritesWebService;

  Future<FavoritesModel> getFavorites() async {
    final data = await favoritesWebService.getFavorites();
    return FavoritesModel.fromJson(data);
  }

}