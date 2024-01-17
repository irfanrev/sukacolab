import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';

import '../../../components/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset your password', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87,),
          onPressed: () => Get.back(),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Enter your email address and we will send you a link to reset your password',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.textTheme.bodyLarge!.color!.withOpacity(0.5),
                ), textAlign: TextAlign.center,),
            const SizedBox(
              height: 46,
            ),
            CustomTextfield(
              hintText: 'Your Email',
              prefixIcon: Icons.email_outlined,
              controller: controller.emailController,
            ),
            const SizedBox(
              height: 32,
            ),
            Obx(
              () => CustomButton(
                onTap: () => controller.resetPassword(),
                text: 'Reset Password',
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      )
    );
  }
}
