import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/bookmark/views/bookmark_view.dart';
import 'package:getx_skeleton/app/modules/community/controllers/community_controller.dart';
import 'package:getx_skeleton/app/modules/community/views/community_view.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_skeleton/app/modules/profile/views/profile_view.dart';
import 'package:getx_skeleton/app/modules/project/controllers/project_controller.dart';
import 'package:getx_skeleton/app/modules/project/views/project_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../../bookmark/controllers/bookmark_controller.dart';

class HomeController extends GetxController {

  RxInt selectedIndex = 0.obs;
  var email = ''.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }


  void changeTab(int index) {
    selectedIndex.value = index;
    if (index == 3) {
      Get.put(ProfileController());
    } else if (index == 2) {
      Get.put(BookmarkController());
    } else if (index == 1) {
      Get.put(CommunityController());
    } else if (index == 0) {
      Get.put(ProjectController(initEmail: email.toString()));
    }
    refresh();
    update();
  }

  List<Widget> pages = [
    const ProjectView(),
    const CommunityView(),
    const BookmarkView(),
    const ProfileView(),
  ];


  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('localUserEmail')!;
  }

  // getting data from api
  // getData() async {
  //   // *) perform api call
  //   await BaseClient.safeApiCall(
  //     Constants.todosApiUrl, // url
  //     RequestType.get, // request type (get,post,delete,put)
  //     onLoading: () {
  //       // *) indicate loading state
  //       apiCallStatus = ApiCallStatus.loading;
  //       update();
  //     },
  //     onSuccess: (response){ // api done successfully
  //       data = List.from(response.data);
  //       // *) indicate success state
  //       apiCallStatus = ApiCallStatus.success;
  //       update();
  //     },
  //     // if you don't pass this method base client
  //     // will automaticly handle error and show message to user
  //     onError: (error){
  //       // show error message to user
  //       BaseClient.handleApiError(error);
  //       // *) indicate error status
  //       apiCallStatus = ApiCallStatus.error;
  //       update();
  //     },
  //   );
  // }

  // @override
  // void onInit() {
  //   getData();
  //   super.onInit();
  // }
}
