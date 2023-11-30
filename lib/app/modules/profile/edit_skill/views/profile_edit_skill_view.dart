import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_skill_controller.dart';

class ProfileEditSkillView extends GetView<ProfileEditSkillController> {
  const ProfileEditSkillView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditSkillView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditSkillView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
