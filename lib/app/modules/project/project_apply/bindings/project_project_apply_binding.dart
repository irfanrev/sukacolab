import 'package:get/get.dart';

import '../controllers/project_project_apply_controller.dart';

class ProjectProjectApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectProjectApplyController>(
      () => ProjectProjectApplyController(),
    );
  }
}
