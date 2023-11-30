import 'package:get/get.dart';

import '../controllers/profile_edit_licenses_controller.dart';

class ProfileEditLicensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditLicensesController>(
      () => ProfileEditLicensesController(),
    );
  }
}
