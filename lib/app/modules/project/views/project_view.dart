import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/project/views/widget/project_header_widget.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          ProjectHeaderWidget(),
          BannerProject(),
          ProjectListing(),
          ProjectListing(),
          ProjectListing(),
          ProjectListing(),
          // ListView.builder(
          //     itemCount: 7,
          //     itemBuilder: (_, index) {
          //       return ProjectListing();
          //     }),
              ],
            ),
        ));
  }
}
