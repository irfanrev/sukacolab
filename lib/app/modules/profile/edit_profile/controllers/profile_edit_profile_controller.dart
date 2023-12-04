import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditProfileController extends GetxController {

  RxString name = ''.obs;
  RxString photoUrl = ''.obs;
  RxString summary = ''.obs;
  var email;
  var isLoading = false.obs;
  final firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
  
  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
    DocumentSnapshot userData = await firestore.collection('users').doc(email.toString()).get();
    nameController.text = userData['name'];
    photoUrl.value = userData['photoUrl'];
    summaryController.text  = userData['summary'];
    print(email);
    print(name.value);
    print(photoUrl.value);
  }


  void updateProfile() async {
    isLoading.value = true;
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty', backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (summaryController.text.isEmpty) {
      Get.snackbar('Error', 'Summary cannot be empty', backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else {
      await firestore.collection('users').doc(email).update({
        'name': nameController.text,
        'summary': summaryController.text,
      });
      Get.snackbar('Success', 'Profile updated successfully', backgroundColor: Colors.green);
      isLoading.value = false;
    }
  }

}
