import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  
  final emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  void resetPassword() async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: emailController.text);
      isLoading.value = false;
      Get.snackbar('Success', 'Reset password link has been sent to your email', backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
