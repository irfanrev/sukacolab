import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/api_error_widget.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/home_controller.dart';
import 'widgets/data_grid.dart';
import 'widgets/employees_list.dart';
import 'widgets/header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        //body for each bottombar
        body: controller.pages[controller.selectedIndex.value],
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.cyan[600],
          unselectedItemColor: Colors.grey[400],
          // showActiveButtonText: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_search_rounded),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
