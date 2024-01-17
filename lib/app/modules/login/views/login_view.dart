import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 62,
            ),
            SvgPicture.asset('assets/images/sukacode-logo.svg'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to SukaColab',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text('Sign in to Continue',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.textTheme.bodyLarge!.color!.withOpacity(0.5),
                )),
            const SizedBox(
              height: 46,
            ),
            CustomTextfield(
              hintText: 'Your Email',
              prefixIcon: Icons.email_outlined,
              controller: controller.emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              hintText: 'Your Password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              controller: controller.passwordController,
            ),
            const SizedBox(
              height: 32,
            ),
            Obx(
              () => CustomButton(
                onTap: () => controller.login(),
                text: 'Sign In',
                isLoading: controller.isLoading.value,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.FORGOT_PASSWORD);
              },
              child: Text('Forgot Password?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
