import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditExperienceController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  var startDate = ''.obs;
  var endDate = ''.obs;
  var isCurrent = false.obs;
  var email;
  var isLoading = false.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
  }

  saveExperience() async {
    isLoading.value = true;
    if (title.text.isEmpty) {
      Get.snackbar('Error', 'Title cannot be empty');
      isLoading.value = false;
      return;
    }
    if (company.text.isEmpty) {
      Get.snackbar('Error', 'Company or Organization cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (startDate.value.isEmpty) {
      Get.snackbar('Error', 'Start date cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (endDate.value.isEmpty && isCurrent.value == false) {
      Get.snackbar('Error', 'End date cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else {
      await firestore
          .collection('users')
          .doc(email)
          .collection('experiences')
          .doc(company.text)
          .set({
        'title': title.text,
        'company': company.text,
        'start_date': startDate.value,
        'end_date': isCurrent.value == true ? 'Present' : endDate.value,
        'is_current': isCurrent.value,
      });
      Get.snackbar('Success', 'Experience added successfully',
          backgroundColor: Colors.green);
      clearData();
      isLoading.value = false;
    }
  }

  void clearData() {
    title.clear();
    company.clear();
    startDate.value = '';
    endDate.value = '';
    isCurrent.value = false;
  }
}
