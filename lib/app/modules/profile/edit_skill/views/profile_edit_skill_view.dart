import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/custom_textfield.dart';
import '../controllers/profile_edit_skill_controller.dart';

class ProfileEditSkillView extends GetView<ProfileEditSkillController> {
  const ProfileEditSkillView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.cyan,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            'Edit Your Skill',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              controller.saveSkill();
            }, icon: Icon(Icons.check_rounded, color: Colors.cyan,)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                prefixIcon: Icons.workspace_premium,
                hintText: 'Add new skill',
                controller: controller.title,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
