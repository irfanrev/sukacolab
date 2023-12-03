import 'package:get/get.dart';

import '../controllers/profile_edit_resume_controller.dart';

class ProfileEditResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditResumeController>(
      () => ProfileEditResumeController(),
    );
  }
}
