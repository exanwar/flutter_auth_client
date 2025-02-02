import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/constants/size_constants.dart';
import 'package:flutter_auth/controllers/onboarding_controller.dart';

class OnboardingBanner extends StatelessWidget {
  const OnboardingBanner({
    super.key,
    required this.bgColor,
    required this.index,
  });

  final Color? bgColor;
  final int index;
  static final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 0,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: bgColor,
          ),
        ),
        Image.asset(
          _onboardingController.onboardingList[index].imageURL!,
          width: AppSizes.onboardingImageSize,
        ),
      ],
    );
  }
}
