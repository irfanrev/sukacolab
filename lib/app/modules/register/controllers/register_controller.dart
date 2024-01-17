import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  final isLoading = false.obs;
  var isObscure = true.obs;
  var isReObscure = true.obs;


  Future register() async {
    try {
      isLoading.value = true;
      if (passwordController.text != rePasswordController.text) {
        Get.snackbar('Error', 'Password and Re-Password must be same');
        isLoading.value = false;
        return;
      } else if (passwordController.text.length < 6) {
        Get.snackbar('Error', 'Password must be at least 6 characters');
        isLoading.value = false;
        return;
      } else if (nameController.text.isEmpty) {
        Get.snackbar('Error', 'Name cannot be empty');
        isLoading.value = false;
        return;
      } else if (emailController.text.isEmpty) {
        Get.snackbar('Error', 'Email cannot be empty');
        isLoading.value = false;
        return;
      } else {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await _firestore
            .collection('users')
            .doc(userCredential.user!.email)
            .set({
          'name': nameController.text,
          'email': emailController.text,
          'summary': '',
          'photoUrl': 'https://avatar.iran.liara.run/public/48',
          'createdAt': DateTime.now().toString(),
          'isVerified': false,
          'resume': '',
        });
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Your account has been created successfully',
          confirmTextColor: Colors.cyan[600],
          onConfirm: () => Get.offAllNamed(Routes.LOGIN),
        );
        /// TODO: uncomment this to save user data in local storage
        // await prefs.setStringList(
        //     'localUserData',
        //     <String>[
        //       userCredential.user!.email!,
        //       userCredential.user!.uid,
        //       nameController.text,
        //       'https://avatar.iran.liara.run/public/48',
        //     ]);
        isLoading.value = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      }
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isLoading.value = false;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void toggleReObscure() {
    isReObscure.value = !isReObscure.value;
  }
}
