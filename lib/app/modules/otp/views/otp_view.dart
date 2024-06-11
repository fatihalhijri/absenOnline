// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  OtpView({Key? key}) : super(key: key);

  final auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 100,
      height: 50,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 107, 165, 212)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.purple),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukan Code OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                  'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus deserunt magnam harum quisquam dolore error, inventore hic consectetur numquam, minima ratione quam saepe dignissimos quos quis. Aspernatur aut molestiae voluptatibus!'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Pinput(
                onSubmitted: (pin) =>auth.cekOtp(pin),
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin)=>auth.cekOtp(pin),
              ),
            )
          ],
        ),
      ),
    );
  }
}
