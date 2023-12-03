import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_resume_controller.dart';

class ProfileEditResumeView extends GetView<ProfileEditResumeController> {
  const ProfileEditResumeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditResumeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditResumeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
