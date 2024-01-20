import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';

class AddProjectController extends GetxController {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectTalentTitle = TextEditingController();
  TextEditingController projectDesc = TextEditingController();
  TextEditingController projectStatus = TextEditingController();
  TextEditingController projectLocation = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  var isLoading = false.obs;

  var email;
  XFile? imageFile;
  var isImagePicked = false.obs;
  var imageUrl = ''.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }


  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source, imageQuality: 50);
      if (pickedImage != null) {
        imageFile = pickedImage;
        isImagePicked.value = true;
      }
    } catch (e) {
      imageFile = null;
      isImagePicked.value = false;
    }
  }

  void uploadImagetoFirebaseStorage(String uuid) async {
    isLoading.value = true;
    try {
      var storageRef = firebaseStorage.ref().child('project/$uuid');
      var uploadTask = storageRef.putFile(File(imageFile!.path));

      // Menunggu hingga proses upload selesai
      var snapshot = await uploadTask.whenComplete(() {});
      var downloadUrl = await snapshot.ref.getDownloadURL();

      imageUrl.value = downloadUrl;

      await firestore.collection('projects').doc(uuid).set({
          'project_name': projectName.text,
          'title': projectTalentTitle.text,
          'status': projectStatus.text,
          'location': projectLocation.text,
          'jobdesc': projectDesc.text,
          'imageUrl': imageUrl.value,
          'email': email,
          'uuid': uuid,
          'published_at': DateTime.now(),
        });
    } catch (e) {
      print(e);
    }
  }


  void addProject() async {
    isLoading.value = true;
    var uuidProject = UuidV1();
    if (projectName.text.isEmpty) {
      Get.snackbar('Error', 'Project Name cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (projectTalentTitle.text.isEmpty) {
      Get.snackbar('Error', 'Project Role cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (projectStatus.text.isEmpty) {
      Get.snackbar('Error', 'Project Status cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (projectLocation.text.isEmpty) {
      Get.snackbar('Error', 'Project location cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (projectDesc.text.isEmpty) {
      Get.snackbar('Error', 'Project description cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else {
      if (isImagePicked.value == true) {
        String finalUuid = Uuid().v1();
        uploadImagetoFirebaseStorage(finalUuid);
        Get.snackbar('Success', 'Project submited successfully',
            backgroundColor: Colors.green);
        isLoading.value = false;
        projectName.clear();
        projectTalentTitle.clear();
        projectStatus.clear();
        projectLocation.clear();
        projectDesc.clear();
        isImagePicked.value = false;
        imageFile = null;
      } else {
        await firestore.collection('projects').add({
          'project_name': projectName.text,
          'title': projectTalentTitle.text,
          'status': projectStatus.text,
          'location': projectLocation.text,
          'jobdesc': projectDesc.text,
          'imageUrl': 'https://avatars.githubusercontent.com/u/14985020?s=80&v=4',
          'email': email,
          'uuid': uuidProject.toString(),
          'published_at': DateTime.now(),
        });
        Get.snackbar('Success', 'Project submited successfully',
            backgroundColor: Colors.green);
        isLoading.value = false;
        projectName.clear();
        projectTalentTitle.clear();
        projectStatus.clear();
        projectLocation.clear();
        projectDesc.clear();
        isImagePicked.value = false;
      }
    }
  }


}
