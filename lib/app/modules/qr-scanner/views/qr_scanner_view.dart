import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/qr_scanner_controller.dart';

class QrScannerView extends GetView<QrScannerController> {
  const QrScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QrScannerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QrScannerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
