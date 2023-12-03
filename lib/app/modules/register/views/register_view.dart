import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 52,
            ),
            SvgPicture.asset('assets/images/sukacode-logo.svg'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Let\'s Get Started',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text('Create a new account',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.textTheme.bodyLarge!.color!.withOpacity(0.5),
                )),
            const SizedBox(
              height: 46,
            ),
            CustomTextfield(
              hintText: 'Your Name',
              prefixIcon: Icons.person_outline,
              controller: controller.nameController,
            ),
            const SizedBox(
              height: 16,
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
              hintText: 'Password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              controller: controller.passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              hintText: 'Password Again',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              controller: controller.rePasswordController,
            ),
            const SizedBox(
              height: 32,
            ),
            Obx(() => CustomButton(
                  text: 'Sign Up',
                  onTap: controller.isLoading.value
                      ? null
                      : () => controller.register(),
                  isLoading: controller.isLoading.value,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
