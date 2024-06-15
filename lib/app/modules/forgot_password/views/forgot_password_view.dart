// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.resetPassword(controller.emailController.text.trim());
              },
              child: Text('Send Password Reset Email'),
            ),
          ],
        ),
      ),
    );
  }
}
