import 'package:man_shop_app/data/models/login/login_model.dart';
import 'package:man_shop_app/data/web_service/authentication/login_web_service.dart';

class LoginRepository {
  LoginWebService loginWebService;
  LoginRepository(this.loginWebService);
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final loginModel =
    await loginWebService.login(email: email, password: password);
    return LoginModel.fromJson(loginModel);
  }

}