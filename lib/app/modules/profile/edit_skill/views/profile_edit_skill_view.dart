import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/custom_textfield.dart';
import '../controllers/profile_edit_skill_controller.dart';

class ProfileEditSkillView extends GetView<ProfileEditSkillController> {
  const ProfileEditSkillView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
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
            IconButton(
                onPressed: () {
                  controller.saveSkill();
                },
                icon: Icon(
                  Icons.check_rounded,
                  color: Colors.cyan,
                )),
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
              Expanded(
                  child: StreamBuilder(
                      stream: firestore
                          .collection('users')
                          .doc(controller.email)
                          .collection('skills')
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final data = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(data[index]['title']),
                                trailing: IconButton(
                                    onPressed: () {
                                      firestore.collection('users')
                                          .doc(controller.email)
                                          .collection('skills')
                                          .doc(data[index]['uuid'])
                                          .delete();
                                    },
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      color: Colors.red,
                                    )),
                              );
                            });
                      })),
            ],
          ),
        ));
  }
}
