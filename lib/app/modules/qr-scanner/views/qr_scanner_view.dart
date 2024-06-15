// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

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
  CameraController _controller = CameraController(autoPlay: false);

  final rs = Get.put(AdminController());
  AbsenModel dt = Get.arguments;

  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? scan;

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
                  data: rs.data[0].id,
                  version: QrVersions.auto,
                  size: 300,
                )),
            FlutterWebQrcodeScanner(
              cameraDirection: CameraDirection.back,
              stopOnFirstResult: false,
              controller: _controller,
              onGetResult: (result) {
                _controller.stopVideoStream();
                print(result);
                Get.toNamed(Routes.ADMIN, arguments: {"id": result});
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
        ));
  }

  // void _onQRViewCreated(QRViewController scan) {
  //   this.scan = scan;
  //   scan.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   scan?.dispose();
  //   super.dispose();
  // }
}
