import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  final Color kDarkBlueColor = Colors.cyan[600]!;
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Get Started',
      onFinish: () {
        controller.getStarted();
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kDarkBlueColor,
      ),
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/images/on1.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/on2.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/on3.png',
          height: 400,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Unlimited Collaboration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'oin Sukacolab, where students connect effortlessly to collaborate on diverse projects. Explore limitless collaboration possibilities with ease!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Streamlined Collaboration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Start collaborative projects seamlessly! Sukacolab offers a user-friendly platform to manage teams and track collective progress effortlessly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Discover Collaborative Potential',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Unleash potential collaborations on Sukacolab!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
