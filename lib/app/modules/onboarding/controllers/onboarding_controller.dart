import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  
  void getStarted() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('isFirstTime', false);

    Get.offAllNamed(Routes.LOGIN);

  }

}
