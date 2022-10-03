import 'package:man_shop_app/data/models/address/address_model.dart';
import 'package:man_shop_app/data/web_service/address/address_web_service.dart';

class AddressRepository {
  AddressWebService addressWebService;

  AddressRepository(this.addressWebService);

  Future<AddressModel> getAddressData() async {
    final data = await addressWebService.getAddressData();
    return AddressModel.fromJson(data);
  }

  Future<String> deleteAddress(int id) async {
    return addressWebService.deleteAddress(id);
  }

  Future<String> addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
    required double latitude,
    required double longitude,
  }) async {
    return addressWebService.addAddress(
      name: name,
      city: city,
      region: region,
      details: details,
      notes: notes,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
