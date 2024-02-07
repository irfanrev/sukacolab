import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_experience.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_header.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_licence.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_skills.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_status.dart';
import 'package:getx_skeleton/app/modules/profile/views/widgets/profile_summary.dart';

import '../../../components/custom_button.dart';
import '../controllers/profile_controller.dart';
import 'widgets/profile_resume.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return SingleChildScrollView(
                controller: controller.scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ProfileHeader(
                      email: arguments ?? controller.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ProfileSummary(
                      email: arguments ?? controller.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ProfileExperience(
                      email: arguments ?? controller.email,
                    ),
                    ProfileCertification(
                      email: arguments ?? controller.email,
                    ),
                    ProfileSkills(
                      email: arguments ?? controller.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ProfileResume(
                      email: arguments ?? controller.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (arguments != null)
                      ProfileStatus(
                        email: arguments ?? controller.email,
                      ),
                    const SizedBox(
                      height: 24,
                    ),
                    if (arguments == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => controller.toPrivacyPolicy(),
                                child: const Text('Privacy Policy'),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ]),
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: arguments == null,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomButton(
                          text: 'Logout',
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Logout',
                              middleText: 'Are you sure you want to logout?',
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    controller.logout();
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Sukacolab V1.0',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              );
            }));
  }
}
