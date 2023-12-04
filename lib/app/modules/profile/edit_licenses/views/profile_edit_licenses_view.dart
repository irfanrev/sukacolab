import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_textfield.dart';
import '../controllers/profile_edit_licenses_controller.dart';

class ProfileEditLicensesView extends GetView<ProfileEditLicensesController> {
  const ProfileEditLicensesView({Key? key}) : super(key: key);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextfield(
                prefixIcon: Icons.workspace_premium,
                hintText: 'Certificate Name',
                controller: controller.title,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                prefixIcon: Icons.corporate_fare_rounded,
                hintText: 'Publiser',
                controller: controller.company,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                prefixIcon: Icons.key_rounded,
                hintText: 'Credential ID (Optional)',
                controller: controller.credential,
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
                        ? 'Publish Date'
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
              Obx(() => TextFormField(
                initialValue: controller.endDate.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: (controller.endDate.value == '')
                      ? 'Expire Date'
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
              )),
              const SizedBox(
                height: 32,
              ),
              Obx(
                () => CustomButton(
                  isLoading: controller.isLoading.value,
                  text: 'Save',
                  onTap: () {
                    controller.saveLicenses();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
