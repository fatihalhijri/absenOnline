// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var scannedCode = ''.obs;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        scannedCode.value = scanData.code!;
        handleQRCodeResult(scanData.code!);
      } else {
        scannedCode.value = '';
      }
    });
  }

  void handleQRCodeResult(String barcodeScanRes) async {
    try {
      // Mendapatkan dokumen dengan ID hasil pemindaian dari koleksi 'absen'
      DocumentSnapshot absenDoc = await firestore
          .collection('absen')
          .doc(barcodeScanRes)
          .get();

      if (absenDoc.exists) {
        Map<String, dynamic> absenData = absenDoc.data() as Map<String, dynamic>;
        
        // Mengubah status menjadi true
        absenData['status'] = true;

        // Memperbarui dokumen di koleksi 'absen'
        await firestore.collection('absen').doc(barcodeScanRes).update({'status': true});

        Get.defaultDialog(middleText: "Status untuk ID $barcodeScanRes berhasil diperbarui menjadi hadir.");
      } else {
        Get.defaultDialog(middleText: "Dokumen dengan ID $barcodeScanRes tidak ditemukan dalam koleksi 'absen'.");
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      Get.defaultDialog(middleText: "Terjadi kesalahan: $error");
    }
  }

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}