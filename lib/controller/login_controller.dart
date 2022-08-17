import 'package:chat_app/network/app_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/UserDataScreen.dart';

class LoginController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String code = "+237";
  late String number;

  RxString numberError = RxString("");
  RxString pinError = RxString("");
  FirebaseAuth auth = FirebaseAuth.instance;
  AppFirebase appFirebase = AppFirebase();
  RxBool isLoading = RxBool(false);

  @override
  void onClose() {
    numberController.dispose();
    otpController.dispose();
  }

  void sendOtp() async {
    if (numberController.text.isEmpty) {
      numberError("Field is required");
    } else if (numberController.text.length < 9) {
      numberError.value = "Invalid number";
    } else {
      numberError("");
      number = code + numberController.text;
      await appFirebase.sendVerificationCode(number);
    }
  }

  void verifyOTP() async {
    if (otpController.text.isEmpty) {
      pinError.value = "Field is required";
    } else if (otpController.text.length < 6) {
      pinError.value = "Invalid Pin";
    } else {
      isLoading.value = true;
      await appFirebase.verifyOtp(otpController.text);
       isLoading.value = false;
      Get.off(const UserDataScreen());
    }
  }
}
