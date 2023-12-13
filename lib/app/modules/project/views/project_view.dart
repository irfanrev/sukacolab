import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/project_model.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firestore = FirebaseFirestore.instance;
    var projectModel = ProjectModel();
    return Scaffold(
        body: GetBuilder<ProjectController>(
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
            }));
  }
}
