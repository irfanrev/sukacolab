import 'package:get/get.dart';

import '../controllers/profile_edit_experience_controller.dart';

class ProfileEditExperienceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditExperienceController>(
      () => ProfileEditExperienceController(),
    );
  }
}
