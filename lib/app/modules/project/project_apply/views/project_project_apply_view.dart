import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/project_project_apply_controller.dart';

class ProjectProjectApplyView extends GetView<ProjectProjectApplyController> {
  const ProjectProjectApplyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectProjectApplyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectProjectApplyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
