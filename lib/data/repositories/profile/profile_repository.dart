import 'package:man_shop_app/data/models/profile/profile_model.dart';
import 'package:man_shop_app/data/web_service/profile/profile_web_service.dart';

class ProfileRepository {
  ProfileRepository(this.profileWebService);

  ProfileWebService profileWebService;

  Future<ProfileModel> getProfileData() async {
    final data = await profileWebService.getProfileData();
    return ProfileModel.fromJson(data);
  }

  Future<ProfileModel> updateUserData({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String image,
  }) async {
    final data = await profileWebService.updateUserData(
      name: name,
      phone: phone,
      email: email,
      password: password,
      image: image,
    );
    return ProfileModel.fromJson(data);
  }
}
