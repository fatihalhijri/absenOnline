// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class QrScannerController extends GetxController {
  scanQr() async {
    String qr = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Batal", true, ScanMode.QR);

    Get.defaultDialog(middleText: "hasil scan adalah ${qr}");
  }

}
