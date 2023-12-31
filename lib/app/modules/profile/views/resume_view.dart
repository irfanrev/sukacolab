import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {

    final c = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Resume View', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close, color: Colors.black),
        )
      ),
    );
  }
}