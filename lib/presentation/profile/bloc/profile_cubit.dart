import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:man_shop_app/data/models/profile/profile_model.dart';
import 'package:man_shop_app/data/repositories/profile/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitialState());

  late ProfileModel profileModel;
  late ProfileRepository profileRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final imagePicker = ImagePicker();
  File? mainImage;
  String? imageProfile;
  bool passwordVisibility = true;
  IconData passwordSuffixIcon = Icons.visibility_outlined;

  bool confirmPasswordVisibility = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility_outlined;

  Future<void> getProfileData() async {
    emit(ProfileLoadingState());
    try {
      profileModel = await profileRepository.getProfileData();
      imageProfile = profileModel.image;
      emit(ProfileSuccessState());
    } catch (error, s) {
      log('getProfileData error', error: error, stackTrace: s);
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> updateUserData() async {
    emit(ProfileLoadingState());
    try {
      imageProfile ??= profileModel.image;
      profileModel = await profileRepository.updateUserData(
        name: nameController.text,
        phone: numberController.text,
        email: emailController.text,
        password: passwordController.text,
        image: imageProfile!,
      );
      clearControllersData();
      emit(ProfileUpdateSuccessState());
    } catch (error, s) {
      log('updateUserData error', error: error, stackTrace: s);
      emit(ProfileErrorState(error.toString()));
    }
  }

  void clearControllersData(){
    nameController.clear();
    numberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mainImage = null;
  }

  Future<void> getImageFromCamera() async {
    emit(ProfileLoadingState());
    try {
      final XFile? photo =
          await imagePicker.pickImage(source: ImageSource.camera);
      convertPhotoToBase64(photo);
      emit(ProfileSuccessState());
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> getImageFromGallery() async {
    final selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    emit(ProfileLoadingState());
    try {
      convertPhotoToBase64(selectedImages);
      emit(ProfileSuccessState());
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future convertPhotoToBase64(dynamic myFileImage) async {
    // ignore: avoid_dynamic_calls
    mainImage = File(myFileImage.path.toString());
    final List<int> fileInByte = mainImage!.readAsBytesSync();
    final String fileInBase64 = base64Encode(fileInByte);
    imageProfile = fileInBase64;
  }

  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    passwordSuffixIcon = passwordVisibility
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ProfileSuccessState());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    confirmPasswordSuffixIcon = confirmPasswordVisibility
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ProfileSuccessState());
  }
}
