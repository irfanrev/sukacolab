import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;
  var username;
  var userEmail;
  var imageUrl;
  var uuidProjectDetail;
  var isVerified = false.obs;
  var isBookmarked = false.obs;

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
    username = userData.data()!['name'];
    userEmail = userData.data()!['email'];
    imageUrl = userData.data()!['photoUrl'];
    isVerified.value = userData.data()!['isVerified'];
  }

  void loadBookmark(String projectUuid) async {
    final bookmarkData = await _firestore
        .collection('users')
        .doc(userEmail)
        .collection('bookmarks')
        .doc(projectUuid)
        .get();
    if (bookmarkData.exists) {
      isBookmarked.value = true;
    } else {
      isBookmarked.value = false;
    }
  }

  void addBookmark(
      String projectUuid,
      String jobdesc,
      String title,
      String projectName,
      String location,
      String publishedAt,
      String status,
      String imageUrl) async {
    isLoading.value = true;
    try {
      await _firestore
          .collection('users')
          .doc(userEmail)
          .collection('bookmarks')
          .doc(projectUuid)
          .set({
        'uuid': projectUuid,
        'jobdesc': jobdesc,
        'title': title,
        'project_name': projectName,
        'location': location,
        'published_at': publishedAt,
        'status': status,
        'imageUrl': imageUrl,
      });
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
      await _firestore.collection('users').doc(userEmail).collection('bookmarks').doc(projectUuid).delete();
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
        .doc(userEmail)
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
        .doc(userEmail)
        .set(
      {
        'email': userEmail,
        'name': username,
        'photoUrl': imageUrl,
        'status': 'Submited',
        'date': DateTime.now(),
      },
    );
    isLoading.value = false;
  }
}
