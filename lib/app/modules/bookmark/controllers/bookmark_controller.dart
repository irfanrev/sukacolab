import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController with GetSingleTickerProviderStateMixin{
  
  final firestore = FirebaseFirestore.instance;
  ScrollController scrollController = ScrollController();

  final List<Widget> myTabs = [
    Tab(text: 'Bookmark'),
    Tab(text: 'My Project'),
  ];

  late TabController controller;

  var email;
  var isScolling = false.obs;

  @override
  void onInit() {
    getLocalData();
    controller = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
   email = prefs.getString('localUserEmail');
  }

}
