import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/add_project_controller.dart';

class AddProjectView extends GetView<AddProjectController> {
  const AddProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Add your project',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add your project details and get more attention',
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Talent Role',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextfield(
                  prefixIcon: Icons.person,
                  hintText: 'Ex : Frontend Developer',
                  controller: controller.projectTalentTitle,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Project Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextfield(
                  prefixIcon: Icons.settings,
                  hintText: 'Ex : SukaColab Project',
                  controller: controller.projectName,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Project Status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextfield(
                  prefixIcon: Icons.timelapse,
                  hintText: 'Ex : Contract 3 months',
                  controller: controller.projectStatus,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Project Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextfield(
                  prefixIcon: Icons.location_on,
                  hintText: 'Ex : Remote',
                  controller: controller.projectLocation,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Job Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: controller.projectDesc,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Ex : We are looking for a Frontend Developer...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Project Image (Optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
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
                    () => (controller.isImagePicked.value == false)
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
                                    Get.defaultDialog(
                                        title: 'Choose Image',
                                        content: Column(
                                          children: [
                                            ListTile(
                                              onTap: () {
                                                controller.getImage(
                                                    ImageSource.camera);
                                                Get.back();
                                              },
                                              leading: Icon(Icons.camera_alt),
                                              title: Text('Camera'),
                                            ),
                                            ListTile(
                                              onTap: () {
                                                controller.getImage(
                                                    ImageSource.gallery);
                                                Get.back();
                                              },
                                              leading: Icon(Icons.photo),
                                              title: Text('Gallery'),
                                            ),
                                          ],
                                        ));
                                  },
                                  child: Text(
                                    'Tap to Upload Image',
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
                                  'Image Chosen',
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
                const SizedBox(
                  height: 28,
                ),
                Obx(
                  () => CustomButton(
                    isLoading: controller.isLoading.value,
                    text: 'Submit',
                    onTap: () {
                      controller.addProject();
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ));
  }
}
