import 'package:man_shop_app/features/home/data/models/categories_model.dart';
import 'package:man_shop_app/features/home/data/models/home_model.dart';
import 'package:man_shop_app/features/home/data/web_service/home_web_service.dart';

class HomeRepository{
  HomeWebService homeWebService;
  HomeRepository(this.homeWebService);

  Future<HomeModel> getHomeData() async {
    final data = await homeWebService.getHomeData();
    return HomeModel.fromJson(data);
  }

  Future<CategoriesModel> getHomeCategories() async {
    final data = await homeWebService.getHomeCategories();
    return CategoriesModel.fromJson(data['data']);
  }
}