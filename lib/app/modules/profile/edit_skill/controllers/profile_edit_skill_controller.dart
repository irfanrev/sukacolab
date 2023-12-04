import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ProfileEditSkillController extends GetxController {
  TextEditingController title = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  var email;
  var uuid = Uuid();

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('localUserEmail');
  }

  void saveSkill() async {
    final skillUid = uuid.v1();
    if (title.text.isEmpty) {
      Get.snackbar('Error', 'Skill name cannot be empty');
      return;
    } else {
      await firestore.collection('users').doc(email).collection('skills').doc(skillUid).set({
        'uuid': skillUid,
        'title': title.text,
      });
      Get.snackbar('Success', 'Skill saved successfully', backgroundColor: Colors.green);
      Get.back();
      title.clear();
    }
  }
}
