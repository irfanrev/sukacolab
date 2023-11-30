import 'package:get/get.dart';

import '../controllers/profile_edit_profile_controller.dart';

class ProfileEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditProfileController>(
      () => ProfileEditProfileController(),
    );
  }
}
