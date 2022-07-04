import 'package:man_shop_app/data/web_service/authentication/register_web_service.dart';

class RegisterRepository {
  RegisterWebService registerWebService;

  RegisterRepository(this.registerWebService);

  Future<String> userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final data = await registerWebService.register(
        name: name, email: email, password: password, phone: phone);
    return data['message'];
  }
}
