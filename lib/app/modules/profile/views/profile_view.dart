import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_experience.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_header.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_licence.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_skills.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_summary.dart';

import '../controllers/profile_controller.dart';
import 'widgets/profile_resume.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          title: const Text(''),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
         // controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          primary: true,
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(
                height: 16,
              ),
              ProfileSummary(),
              SizedBox(
                height: 16,
              ),
              ProfileExperience(),
              ProfileCertification(),
              ProfileSkills(),
              SizedBox(
                height: 16,
              ),
              ProfileResume(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
