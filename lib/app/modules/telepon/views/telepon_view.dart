// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/telepon_controller.dart';

class TeleponView extends GetView<TeleponController> {
  TeleponView({Key? key}) : super(key: key);

  final auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nomer Telepon'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('data'),
              Text('Nomer Telepon',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              TextField(
                controller: controller.phone,
                decoration: InputDecoration(
                    hintText: 'Ketikan Nomer Telepon Anda',
                    hintStyle:
                        TextStyle(fontSize: 18, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(15),
                      child: Text('+62'),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => auth.sendOtp(controller.phone.text),

                // onPressed: () =>
                // auth.login(controller.email.text, controller.password.text),
                child: Text('Kirim OTP!'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue),
              ),
            ],
          ),
        ));
  }
}
