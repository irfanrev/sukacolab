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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.file_copy_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'File Name (For Display)',
                ),
                maxLength: 8,
              ),
            ),
            Obx(
              () => (controller.isFilePicked == false)
                  ? Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.pickFile();
                        },
                        child: const Text('Upload Resume'),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.addResumeFile();
                        },
                        child: const Text('Save Resume'),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
