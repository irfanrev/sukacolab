import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProjectController extends GetxController {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectTalentTitle = TextEditingController();
  TextEditingController projectDesc = TextEditingController();
  TextEditingController projectStatus = TextEditingController();
  TextEditingController projectLocation = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  final storage = firebase_storage.FirebaseStorage.instance;

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

  
}
