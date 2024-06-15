// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:absenonline/app/modules/admin/controllers/admin_controller.dart';
import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../controllers/qr_scanner_controller.dart';

class QrScannerView extends GetView<QrScannerController> {
  QrScannerView({Key? key}) : super(key: key);
  final CameraController _controller = CameraController(autoPlay: false);

  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    print('----------------------------');
    print(Get.arguments);
    print('----------------------------');
    AbsenModel dt = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
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
              data: dt.id,
              version: QrVersions.auto,
              size: 300,
            ),
          ),
          FlutterWebQrcodeScanner(
            cameraDirection: CameraDirection.back,
            stopOnFirstResult: false,
            controller: _controller,
            onGetResult: (result) {
              _controller.stopVideoStream();
              print('----------------------------');
              print(result);
              print('----------------------------');
              controller.handleQRCodeResult(result);
              Get.offAllNamed(Routes.ADMIN);
            },
            width: 500,
            height: 500,
          ),
          ElevatedButton(
            onPressed: () {
              // Ensure to start or resume the camera stream
              _controller.startVideoStream();
            },
            child: Text('Start Scanning'),
          ),
        ],
      ),
    );
  }
}