import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../controllers/profile_edit_experience_controller.dart';

class ProfileEditExperienceView
    extends GetView<ProfileEditExperienceController> {
  const ProfileEditExperienceView({Key? key}) : super(key: key);
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
          'Edit Experience',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextfield(
              prefixIcon: Icons.work_outline,
              hintText: 'Job Title',
              controller: controller.title,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              prefixIcon: Icons.corporate_fare_rounded,
              hintText: 'Company/Organization',
              controller: controller.company,
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => TextFormField(
                initialValue: controller.startDate.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: (controller.startDate.value == '')
                      ? 'Start Date'
                      : controller.startDate.value.replaceRange(10, 23, ''),
                ),
                onTap: () async {
                  final selectedDate = await showMonthYearPicker(
                    context: Get.context!,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030),
                  );
                  if (selectedDate != null) {
                    controller.startDate.value = selectedDate.toString();
                    print(controller.startDate.value.toString());
                  }
                },
                readOnly: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: controller.isCurrent.value,
                    onChanged: (value) {
                      controller.isCurrent.value = value!;
                    },
                  ),
                  Text('I currently work here'),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Visibility(
                  visible: controller.isCurrent.value == false,
                  child: TextFormField(
                    initialValue: controller.endDate.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: (controller.endDate.value == '')
                          ? 'End Date'
                          : controller.endDate.value.replaceRange(10, 23, ''),
                    ),
                    onTap: () async {
                      final selectedDate = await showMonthYearPicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                      );
                      if (selectedDate != null) {
                        controller.endDate.value = selectedDate.toString();
                        print(controller.endDate.value.toString());
                      }
                    },
                    readOnly: true,
                  ),
                )),
            const SizedBox(
              height: 32,
            ),
            Obx(
              () => CustomButton(
                isLoading: controller.isLoading.value,
                text: 'Save',
                onTap: () {
                  controller.saveExperience();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
