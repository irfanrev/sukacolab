import 'package:get/get.dart';

import '../controllers/purpose_project_controller.dart';

class PurposeProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurposeProjectController>(
      () => PurposeProjectController(),
    );
  }
}
