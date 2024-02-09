import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class ProjectController extends GetxController {
  //TODO: Implement ProjectController
  final firestore = FirebaseFirestore.instance;
  TextEditingController search = TextEditingController();
  var searchResult = ''.obs;
  String? initEmail;
  ProjectController({this.initEmail});

  final GlobalKey one = GlobalKey();
  final GlobalKey two = GlobalKey();
  final GlobalKey three = GlobalKey();
  final GlobalKey four = GlobalKey();

  var isBookmark = false.obs;
  var email = ''.obs;
  var isVerify = false.obs;
  var isScolling = false.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('localUserEmail')!;
  }

  void searchProject() {
    searchResult.value = search.text;
    print(searchResult.value);
    Get.to(ProjectSearch(), arguments: searchResult.value);
  }

  void checkUser() async {
    try {
      final dataUser =
          await firestore.collection('users').doc(email.value).get();
      isVerify.value = dataUser.data()!['isVerified'];
    } catch (e) {
      print(e);
    }
  }
}
