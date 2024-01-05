import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ProfileController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  ScrollController scrollController = ScrollController();

  var email;
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

  void getApplicationData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = await firestore.collection('users').doc(email).get();
    prefs.setString('applicationData', userData.data()!['applications']);
  }

  void downloadResume(String pdfUrl) async {
    try {
      await FileDownloader.downloadFile(
          url: pdfUrl,
          name: 'resume.pdf',
          notificationType: NotificationType.all,
          downloadDestination: DownloadDestinations.publicDownloads);
      Get.snackbar('Success', 'Resume Downloaded Successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
      print(e);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('localUserEmail');
    Get.offAllNamed('/login');
  }

  void urlEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar('Error', 'Could not launch $url',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
    }
  }

  void urlResume(String pdf) async {
    final Uri params = Uri.parse(pdf);
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      Get.snackbar('Error', 'Could not launch $url',
          backgroundColor: Colors.deepOrange, colorText: Colors.white);
    }
  }
}
