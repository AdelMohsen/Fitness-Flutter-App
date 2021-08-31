import 'package:fitness_app/constans/reuse_widget.dart';
import 'package:fitness_app/constans/theme.dart';
import 'package:fitness_app/screens/main_layout.dart';
import 'package:fitness_app/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final onboardList = [
    PageViewModel(
      title: "Workout anywhere",
      body:
          "you can do any workout at home without equipment , outside or at the gym",
      image: Image.asset('assets/onboarding/onboarding1.png'),
      decoration: const PageDecoration(
        titleTextStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w500,
            fontSize: 18.0),
        bodyTextStyle: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "Learn techniques",
      body: "Our workout programs are made by professionals.",
      image: Image.asset('assets/onboarding/onboarding2.png'),
      decoration: const PageDecoration(
        titleTextStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w500,
            fontSize: 18.0),
        bodyTextStyle: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "Stay strong & healthy",
      body:
          "We want you to fully enjoy the program and stay healthy and positive.",
      image: Image.asset('assets/onboarding/onboarding3.png'),
      decoration: const PageDecoration(
        titleTextStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w500,
            fontSize: 18.0),
        bodyTextStyle: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0.0,
        ),
        body: IntroductionScreen(
          globalBackgroundColor: mainColor,
          pages: onboardList,
          onDone: () {
            navigateAndRemove(context, MainScreen());
            Shared.setBoolean(key: 'endOnBoarding', value: true);
          },
          onSkip: () {
            navigateAndRemove(context, MainScreen());
            Shared.setBoolean(key: 'endOnBoarding', value: true);
          },
          showSkipButton: true,
          skip: const Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
          next: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.cyanAccent,
              color: Colors.white,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ));
  }
}
