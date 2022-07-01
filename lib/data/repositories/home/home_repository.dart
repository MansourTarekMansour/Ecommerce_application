import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/web_service/home/home_web_service.dart';

class HomeRepository{
  HomeWebService homeWebService;
  HomeRepository(this.homeWebService);

  Future<HomeModel> getHomeData() async {
    final data = await homeWebService.getHomeData();
    return HomeModel.fromJson(data);
  }
}