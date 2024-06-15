// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/widgets.dart';

class QrScannerController extends GetxController {
  scanQr() async {
    String qr = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Batal", true, ScanMode.QR);

    Get.defaultDialog(middleText: "hasil scan adalah ${qr}");
  }

  var scannedCode = ''.obs;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        scannedCode.value = scanData.code!;
      } else {
        scannedCode.value = '';
      }
    });
  }

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}
