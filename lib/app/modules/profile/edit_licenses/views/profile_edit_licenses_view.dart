import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_licenses_controller.dart';

class ProfileEditLicensesView extends GetView<ProfileEditLicensesController> {
  const ProfileEditLicensesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditLicensesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditLicensesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
