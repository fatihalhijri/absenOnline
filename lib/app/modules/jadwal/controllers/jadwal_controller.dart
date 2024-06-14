// ignore_for_file: prefer_const_constructors, unnecessary_overrides

import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Jadwal> data = [];

  
  getJadwal() async {
    final jadwal = await firestore.collection("jadwal").get();
    try {
      if (jadwal.docs.isNotEmpty) {
        jadwal.docs.map((e) {
          Jadwal jadwalList = Jadwal.fromJson(Map.from(e.data()), e.id);
          data.add(jadwalList);
        }).toList();
        status.value = true;
      }
    } catch (e) {
      print('dfgsdcaevudgqywe34r5t6y6u ${e}');
    }
  }

  deleteProduct(String id) async {
    try {
      await firestore.collection('jadwal').doc(id).delete();
      Get.showSnackbar(GetSnackBar(
        title: 'Berhasil',
        message: 'Berhasil Menghapus',
        duration: Duration(seconds: 2),
      ));
      Get.offAllNamed(Routes.JADWAL);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menghapus Product');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getJadwal();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
