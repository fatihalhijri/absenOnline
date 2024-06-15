// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lupapass_controller.dart';

class LupapassView extends GetView<LupapassController> {
   LupapassView({Key? key}) : super(key: key);
   final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('LupapassView'),
        centerTitle: true,
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: 18),
        child:Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Text('data'),
              Text('Lupa Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    hintText: 'Ketikan Email Anda',
                    hintStyle:
                        TextStyle(fontSize: 18, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow))),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
              onPressed: () {
                final email =  controller.email.text.trim();
                if (email.isNotEmpty) {
                  auth.resetpass(email);
                } else {
                  Get.snackbar('Error', 'Please enter your email', snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Reset Password'),
            ),
            ],
          ),
      )
    );
  }
}
