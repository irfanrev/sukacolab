import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/project_model.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firestore = FirebaseFirestore.instance;
    var projectModel = ProjectModel();
    return Scaffold(body: ShowCaseWidget(builder: Builder(builder: (context) {
      return GetBuilder<ProjectController>(
        initState: (state) async {
          final prefs = await SharedPreferences.getInstance();
          if (prefs.getBool('isFirstShowcase') == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ShowCaseWidget.of(context).startShowCase(
                  [controller.one, controller.two, controller.three]);
              prefs.setBool('isFirstShowcase', false);
            });
          }
        },
        init: ProjectController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const ProjectHeaderWidget(),
                const BannerProject(),
                const ProjectContent(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      );
    })));
  }
}
