import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;
  var username;
  RxString userEmail = ''.obs;
  var imageUrl;
  var uuidProjectDetail;
  var isVerified = false.obs;
  RxBool isBookmarked = false.obs;

  @override
  void onInit() {
    getUserData();
    loadBookmark(Get.arguments['uuid']);
    super.onInit();
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = await _firestore
        .collection('users')
        .doc(prefs.getString('localUserEmail'))
        .get();
    print(Get.arguments['uuid']);
    username = userData.data()!['name'];
    userEmail.value = userData.data()!['email'];
    imageUrl = userData.data()!['photoUrl'];
    isVerified.value = userData.data()!['isVerified'];
  }

  void loadBookmark(String projectUuid) async {
     final prefs = await SharedPreferences.getInstance();
     final proUid = prefs.getString(projectUuid);
     print('projectUuid: $projectUuid');
      print('Local uuid: $proUid');
    if (proUid == projectUuid) {
      isBookmarked.value = true;
      update();
    } else {
      isBookmarked.value = false;
      update();
    }
    print('isBookmarked: ${isBookmarked.value}');
  }

  void addBookmark(
      String projectEmail,
      String projectUuid,
      String jobdesc,
      String title,
      String projectName,
      String location,
      Timestamp publishedAt,
      String status,
      String imageUrl,
      bool isVerified,
      ) async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      await _firestore
          .collection('users')
          .doc(userEmail.value)
          .collection('bookmarks')
          .doc(projectUuid)
          .set({
        'email': projectEmail,
        'uuid': projectUuid,
        'jobdesc': jobdesc,
        'title': title,
        'project_name': projectName,
        'location': location,
        'published_at': publishedAt,
        'status': status,
        'imageUrl': imageUrl,
        'isVerified': isVerified,
      });
      prefs.setString(projectUuid, projectUuid);
      print('projectUuid: $projectUuid');
      Get.snackbar('Success', 'Project added to bookmark',
          backgroundColor: Colors.green, colorText: Colors.white);
      isBookmarked.value = true;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
      print(e);
    }
  }

  void removeBookmark(String projectUuid) async {
    isLoading.value = true;
    try {
      await _firestore.collection('users').doc(userEmail.value).collection('bookmarks').doc(projectUuid).delete();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(projectUuid);
      isBookmarked.value = false;
      Get.snackbar('Success', 'Project removed from bookmark',
          backgroundColor: Colors.green, colorText: Colors.white);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
      print(e);
    }
  }

  void joinProject(String uuid, String title, String projectName,
      String location, String published) async {
    isLoading.value = true;
    await _firestore
        .collection('users')
        .doc(userEmail.value)
        .collection('applications')
        .doc(uuid)
        .set(
      {
        'uuid': uuid,
        'status': 'Submited',
        'date': DateTime.now(),
        'title': title,
        'project_name': projectName,
        'location': location,
        'project_published': published,
      },
    );

    await _firestore
        .collection('projects')
        .doc(uuid)
        .collection('applications')
        .doc(userEmail.value)
        .set(
      {
        'email': userEmail.value,
        'name': username,
        'photoUrl': imageUrl,
        'status': 'Submited',
        'date': DateTime.now(),
      },
    );
    isLoading.value = false;
  }
}
