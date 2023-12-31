import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_resume_controller.dart';

class ProfileEditResumeView extends GetView<ProfileEditResumeController> {
  const ProfileEditResumeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Your Resume', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close, color: Colors.black),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan[600]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => (controller.isFilePicked.value == false)
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.upload_file,
                              color: Colors.cyan,
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () {
                                controller.pickFile();
                              },
                              child: Text(
                                'Tap to Upload Resume',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan[600]),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'File Chosen',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[600]),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () =>  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: controller.isFilePicked.value == true
                              ? Colors.cyan[600]
                              : Colors.grey[400],
                        ),
                        onPressed: controller.isFilePicked.value == true ? () {
                          controller.addResumeFile();
                        } : () {},
                        child: controller.isLoading.value == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text('Upload Resume'),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
