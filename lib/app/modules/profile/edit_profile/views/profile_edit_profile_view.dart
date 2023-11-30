import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_profile_controller.dart';

class ProfileEditProfileView extends GetView<ProfileEditProfileController> {
  const ProfileEditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
