import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_management_projecct/src/feature/Authentication/models/User_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(Usermodel Users) async {
    await _db.collection("users").add(Users.toJson()
            .whenComplete(
          () => Get.snackbar("Success", "Your account is created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
            .catchError((error, StackTrace) {
          Get.snackbar("Error", "Something wet wrong. Try again",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          print(error.toString());
        }));
  }
}
