import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_management_projecct/Screen/otp_screen.dart';
import 'package:society_management_projecct/src/feature/Authentication/models/User_model.dart';
import 'package:society_management_projecct/src/repository/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(Usermodel Users) async {
    await userRepo.createUser(Users);
    // phoneAuthentication(Users.phoneNumber);
    Get.to(() => OtpScreen());
  }

  // void phoneAuthentication(String phoneNo) {
  //   AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  // }
}
