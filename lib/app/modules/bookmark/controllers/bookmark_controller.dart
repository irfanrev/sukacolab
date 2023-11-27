import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkController extends GetxController {
  //TODO: Implement BookmarkController

  TabController tabController = TabController(length: 2, vsync: NavigatorState());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
