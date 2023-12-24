import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditProfileController extends GetxController {
  RxString name = ''.obs;
  RxString photoUrl = ''.obs;
  RxString summary = ''.obs;
  var email;
  var isLoading = false.obs;
  final firestore = FirebaseFirestore.instance;
  XFile? imageFile;
  var isImagePicked = false.obs;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
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
    DocumentSnapshot userData =
        await firestore.collection('users').doc(email.toString()).get();
    nameController.text = userData['name'];
    photoUrl.value = userData['photoUrl'];
    summaryController.text = userData['summary'];
    print(email);
    print(name.value);
    print(photoUrl.value);
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

  // void uploadImagetoFirebaseStorage() async {
  //   isLoading.value = true;
  //   if (imageFile == null) {
  //     Get.snackbar('Error', 'Please select an image',
  //         backgroundColor: Colors.deepOrange);
  //     isLoading.value = false;
  //     return;
  //   } else {
  //     await firebaseStorage
  //         .ref()
  //         .child('users/${nameController.text}')
  //         .putFile(File(imageFile!.path));
  //     final prefs = await SharedPreferences.getInstance();
  //     final ref =
  //         firestore.collection('users').doc(prefs.getString('localUserEmail'));
  //     await ref.update({
  //       'photoUrl': photoUrl.value,
  //     });
  //     Get.snackbar('Success', 'Photo updated successfully',
  //         backgroundColor: Colors.green);
  //     isLoading.value = false;
  //   }
  // }

  void uploadImagetoFirebaseStorage() async {
  isLoading.value = true;
  if (imageFile == null) {
    Get.snackbar('Error', 'Please select an image',
        backgroundColor: Colors.deepOrange);
    isLoading.value = false;
    return;
  } else {
    // Upload gambar ke Firebase Storage
    var storageRef = firebaseStorage.ref().child('users/${email.toString()}');
    var uploadTask = storageRef.putFile(File(imageFile!.path));
    
    // Menunggu hingga proses upload selesai
    var snapshot = await uploadTask.whenComplete(() {});
    var downloadUrl = await snapshot.ref.getDownloadURL();
    
    final prefs = await SharedPreferences.getInstance();
    final ref = firestore.collection('users').doc(prefs.getString('localUserEmail'));
    
    // Update data 'photoUrl' di Firestore dengan URL gambar yang diunggah
    await ref.update({
      'photoUrl': downloadUrl,
    });

    Get.snackbar('Success', 'Photo updated successfully',
        backgroundColor: Colors.green);
    isLoading.value = false;
  }
}

  void updateProfile() async {
    isLoading.value = true;
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else if (summaryController.text.isEmpty) {
      Get.snackbar('Error', 'Summary cannot be empty',
          backgroundColor: Colors.deepOrange);
      isLoading.value = false;
      return;
    } else {
      if (isImagePicked.value == true) {
        uploadImagetoFirebaseStorage();
        await firestore.collection('users').doc(email).update({
          'name': nameController.text,
          'summary': summaryController.text,
        });
        Get.snackbar('Success', 'Profile updated successfully',
            backgroundColor: Colors.green);
        isLoading.value = false;
      } else {
        await firestore.collection('users').doc(email).update({
          'name': nameController.text,
          'summary': summaryController.text,
        });
        Get.snackbar('Success', 'Profile updated successfully',
            backgroundColor: Colors.green);
        isLoading.value = false;
      }
    }
  }
}
