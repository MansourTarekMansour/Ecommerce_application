import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/data/models/address/address_model.dart';
import 'package:man_shop_app/data/repositories/address/address_repository.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressRepository) : super(AddressInitial());

  AddressRepository addressRepository;
  AddressModel? addressModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  double latitude = 0;
  double longitude = 0;

  Future<void> getAddressData() async {
    emit(AddressLoadingState());
    try {
      addressModel = await addressRepository.getAddressData();
      if (addressModel!.data.isNotEmpty) {
        addressModel!.data[0].menuOnPress = true;
      }
      emit(AddressSuccessState());
    } catch (error, s) {
      log('getCartData error', error: error, stackTrace: s);
      emit(AddressErrorState(error.toString()));
    }
  }

  Future<void> deleteAddress(int index, int id) async {
    emit(AddressLoadingState());
    try {
      final message = await addressRepository.deleteAddress(id);
      addressModel!.data.removeAt(index);
      emit(AddressSuccessState());
    } catch (error, s) {
      log('getCartData error', error: error, stackTrace: s);
      emit(AddressErrorState(error.toString()));
    }
  }

  Future<void> addAddress() async {
    emit(AddressLoadingState());
    try {
      final message = await addressRepository.addAddress(
        name: nameController.text,
        city: cityController.text,
        region: regionController.text,
        details: detailsController.text,
        notes: notesController.text,
        latitude: latitude,
        longitude: latitude,
      );
      clearControllersData();
      getAddressData();
      emit(AddressAddSuccessState());
    } catch (error, s) {
      log('addAddress error', error: error, stackTrace: s);
      emit(AddressErrorState(error.toString()));
    }
  }

  void clearControllersData(){
    nameController.clear();
    cityController.clear();
    regionController.clear();
    detailsController.clear();
    notesController.clear();

  }

  void emitMenuOnPress(int index) {
    if (addressModel!.data[index].menuOnPress == false) {
      for (var value in addressModel!.data) {
        value.menuOnPress = false;
      }
      addressModel!.data[index].menuOnPress = true;
    } else {
      addressModel!.data[index].menuOnPress =
          !addressModel!.data[index].menuOnPress;
    }
    emit(AddressSuccessState());
  }

// Placemark _pickPlaceMark = Placemark();
// Placemark get pickPlaceMark => _pickPlaceMark;
// List<Prediction> _predictionList = [];
// late final GoogleMapController locationController ;
//
// Future<List<Prediction>> searchLocation(context, String text) async {
//   if(text != null && text.isNotEmpty) {
//     http.Response response = await getLocationData(text);
//     var data = jsonDecode(response.body.toString());
//     print("my status is "+data["status"]);
//     if ( data['status']== 'OK') {
//       _predictionList = [];
//       data['predictions'].forEach((prediction)
//       => _predictionList.add(Prediction.fromJson(prediction)));
//     } else {
//       // ApiChecker.checkApi(response);
//     }
//   }
//   return _predictionList;
// }
}
