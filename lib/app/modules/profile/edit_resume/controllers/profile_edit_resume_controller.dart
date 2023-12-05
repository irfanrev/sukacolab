import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditResumeController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  TextEditingController title = TextEditingController();

  final storage = FirebaseStorage.instance;

  File? resumeFile;
  var isFilePicked = false.obs;

  void addResumeFile() async {
    try {
      await storage.ref('resume').putFile(resumeFile!);
      await firestore.collection('resume').add({
        'title': title.text,
        'resume': resumeFile,
      });
      Get.snackbar('Success', 'Resume Added Successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      print(e);
    }
  }

  void addResume() async {
    try {
      await firestore.collection('resume').add({
        'title': title.text,
        'resume': resumeFile,
      });
    } catch (e) {
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
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
