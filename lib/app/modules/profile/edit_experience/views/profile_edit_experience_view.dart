import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_experience_controller.dart';

class ProfileEditExperienceView
    extends GetView<ProfileEditExperienceController> {
  const ProfileEditExperienceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditExperienceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditExperienceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
