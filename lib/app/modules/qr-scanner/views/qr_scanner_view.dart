// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/qr_scanner_controller.dart';

class QrScannerView extends GetView<QrScannerController> {
   QrScannerView({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    // Jadwal data = Get.arguments;
  //   const data = Get.arguments;
  //  controller.updateVariable(data);
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                height: 300,
                margin: EdgeInsets.only(bottom: 20),
                child: QrImageView(
                  data: "ID-DATA-KALIAN-MASING-MASING",
                  version: QrVersions.auto,
                  size: 300,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () => controller.scanQr(), child: Text("Scan QR")),
            )
          ],
        ));
  }
}
