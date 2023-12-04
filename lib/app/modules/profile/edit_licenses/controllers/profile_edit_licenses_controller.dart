import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ProfileEditLicensesController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController credential = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  var startDate = ''.obs;
  var endDate = ''.obs;
  var isCurrent = false.obs;
  var email;
  var isLoading = false.obs;
  var uuid = Uuid();

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
  }

  saveLicenses() async {
    isLoading.value = true;
    if (title.text.isEmpty) {
      Get.snackbar('Error', 'Certificate name cannot be empty');
      isLoading.value = false;
      return;
    }
    if (company.text.isEmpty) {
      Get.snackbar('Error', 'Publisher cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (startDate.value.isEmpty) {
      Get.snackbar('Error', 'Published date cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (endDate.value.isEmpty && isCurrent.value == false) {
      Get.snackbar('Error', 'Expire date cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else {
      final licensesUid = uuid.v1();
      await firestore
          .collection('users')
          .doc(email)
          .collection('licences')
          .doc(licensesUid)
          .set({
        'uuid': licensesUid,
        'title': title.text,
        'company': company.text,
        'credential': credential.text.isEmpty ? '' : credential.text,
        'publish_date': startDate.value,
        'expire_date': endDate.value,
      });
      Get.snackbar('Success', 'Licenses added successfully',
          backgroundColor: Colors.green);
      clearData();
      isLoading.value = false;
    }
  }

  void clearData() {
    title.clear();
    company.clear();
    credential.clear();
    startDate.value = '';
    endDate.value = '';
    isCurrent.value = false;
  }
}
