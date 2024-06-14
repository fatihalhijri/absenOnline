import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddJadwalController extends GetxController {
    TextEditingController
      mapel = new TextEditingController(),
      hari = new TextEditingController(),
      jamMasuk = new TextEditingController(),
      jamKeluar = new TextEditingController(),
      kehadiran = new TextEditingController();
  //TODO: Implement JadwalController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxString url = ''.obs;

  saveJadwal() async {
    CollectionReference jadwal = firestore.collection("jadwal");

    final jadwalData = {
      "mapel": mapel.text,
      "hari": hari.text,
      "jamMasuk": jamMasuk.text,
      "jamKeluar": jamKeluar.text,
      "kehadiran": kehadiran.text
    };

    try {
      await jadwal.add(jadwalData).then((value) {
        Get.defaultDialog(
          middleText: "Berhasil Menambah jadwal",
        );
        Get.offAllNamed(Routes.JADWAL);
      });
    } catch (e) {
      Get.defaultDialog(
        middleText: "Gagal Menambah jadwal",
      );
    }
  }
  //TODO: Implement AddJadwalController

  final count = 0.obs;
  @override
  void onInit() {
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
