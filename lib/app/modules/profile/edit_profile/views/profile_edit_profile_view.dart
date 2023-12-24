import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_edit_profile_controller.dart';

class ProfileEditProfileView extends GetView<ProfileEditProfileController> {
  const ProfileEditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close_rounded,
              color: Colors.cyan,
            )),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(child:
            GetBuilder<ProfileEditProfileController>(builder: (controller) {
          return Column(
            children: [
              Obx(
                () => InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: 'Choose Image',
                        content: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                controller.getImage(ImageSource.camera);
                                Get.back();
                              },
                              leading: Icon(Icons.camera_alt),
                              title: Text('Camera'),
                            ),
                            ListTile(
                              onTap: () {
                                controller.getImage(ImageSource.gallery);
                                Get.back();
                              },
                              leading: Icon(Icons.photo),
                              title: Text('Gallery'),
                            ),
                          ],
                        ));
                  },
                  child: controller.isImagePicked.value
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              FileImage(File(controller.imageFile!.path)),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(controller.photoUrl.value),
                        ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: TextFormField(
                  controller: controller.summaryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 15,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Obx(
                () => CustomButton(
                  isLoading: controller.isLoading.value,
                  text: 'Save',
                  onTap: () {
                    controller.updateProfile();
                  },
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
