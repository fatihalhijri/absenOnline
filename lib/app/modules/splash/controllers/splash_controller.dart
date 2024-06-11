// ignore_for_file: unnecessary_overrides, prefer_const_constructors, deprecated_member_use

import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToLogin();
      }
    });
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 0));
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
