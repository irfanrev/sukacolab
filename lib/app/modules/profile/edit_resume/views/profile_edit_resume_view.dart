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
      body: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            maxLength: 8,
            ),
          ),
        ],
      ),
    );
  }
}
