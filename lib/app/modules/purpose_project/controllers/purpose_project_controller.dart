import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PurposeProjectController extends GetxController {
  

  void perfomeWhatsApp() async {
    try {
      var url = "https://wa.me/6285559759692";
      await launch(url);
    } catch (e) {
      print(e);
    }
  }

  void perfomeEmail() async {
    try {
      var url = "mailto:sukacode.dev@gmail.com?subject=Need Help&body=Hi SukaCode,";
      await launch(url);
    } catch (e) {
      print(e);
    }
  }

  void perfomeDiscord() async {
    try {
      var url = "https://discord.gg/XtKRHngnG7";
      await launch(url);
    } catch (e) {
      print(e);
    }
  }

}
