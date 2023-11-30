import 'package:get/get.dart';

import '../controllers/profile_edit_skill_controller.dart';

class ProfileEditSkillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditSkillController>(
      () => ProfileEditSkillController(),
    );
  }
}
