import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectController extends GetxController {
  //TODO: Implement ProjectController
  final firestore = FirebaseFirestore.instance;
  TextEditingController search = TextEditingController();
  var searchResult = ''.obs;

  var email;
  var isVerify = false.obs;
  var isScolling = false.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
   email = prefs.getString('localUserEmail');
  }

  void searchProject() {
    searchResult.value = search.text;
    print(searchResult.value);
  }

  void checkUser() async {
    try {
      final dataUser = await firestore.collection('users').doc(email).get();
      isVerify.value = dataUser.data()!['isVerified'];
    } catch (e) {
     print(e);
    }
  }
}
