import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_project_controller.dart';

class AddProjectView extends GetView<AddProjectController> {
  const AddProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddProjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
