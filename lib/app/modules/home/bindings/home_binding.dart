import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project/controllers/project_controller.dart';

import '../../bookmark/controllers/bookmark_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProjectController>(
      () => ProjectController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
  }
}
