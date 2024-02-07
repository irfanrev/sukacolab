import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var isObscure = true.obs;

  Future login() async {
    try {
      isLoading.value = true;
      if (emailController.text.isEmpty) {
        Get.snackbar('Error', 'Email cannot be empty');
        isLoading.value = false;
        return;
      } else if (passwordController.text.isEmpty) {
        Get.snackbar('Error', 'Password cannot be empty');
        isLoading.value = false;
        return;
      } else {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        addLocalUserEmail();
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something error');
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  addLocalUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('localUserEmail', emailController.text);
    print('Local user email added');
  }
}
