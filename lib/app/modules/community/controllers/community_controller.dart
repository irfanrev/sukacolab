import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityController extends GetxController {
  
  var email;
  var isVerify = false.obs;
  var isScolling = false.obs;

  @override
  void onInit() {
    getLocalData();
    super.onInit();
  }

  void getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
   email = prefs.getString('localUserEmail');
  }

}
