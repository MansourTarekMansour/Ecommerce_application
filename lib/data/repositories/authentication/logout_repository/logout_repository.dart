import 'package:man_shop_app/data/web_service/authentication/logout_web_service.dart';

class LogoutRepository {
  LogoutWebService logoutWebService;
  LogoutRepository(this.logoutWebService);

  Future<Map<String, dynamic>> logout() async {
    return await logoutWebService.logout();
  }
}