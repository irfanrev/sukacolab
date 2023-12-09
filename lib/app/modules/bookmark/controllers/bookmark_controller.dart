import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  
  final firestore = FirebaseFirestore.instance;
  ScrollController scrollController = ScrollController();

  var email;
  var isScolling = false.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  Future getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
   email = prefs.getString('localUserEmail');
  }

}
