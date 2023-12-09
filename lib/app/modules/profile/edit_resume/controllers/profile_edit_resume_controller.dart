import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditResumeController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  TextEditingController title = TextEditingController();

  final storage = FirebaseStorage.instance;

  File? resumeFile;
  var isFilePicked = false.obs;
  var isLoading = false.obs;

  var email;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
  }

  void addResumeFile() async {
    isLoading.value = true;
    try {
      final upload = await storage.ref('resume-irfan@mail.com.pdf').putFile(resumeFile!);
      await firestore.collection('users').doc('irfan@mail.com').update({
        'resume': await upload.ref.getDownloadURL(),
      });
      Get.snackbar('Success', 'Resume Added Successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
      isLoading.value = false;
      print(e);

    }
  }

  void pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        resumeFile = File(result.files.single.path!);
        isFilePicked.value = true;
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
