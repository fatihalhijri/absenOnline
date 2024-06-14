// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateJadwalController extends GetxController {
  TextEditingController mapel = TextEditingController();
  TextEditingController hari = TextEditingController();
  TextEditingController jamMasuk = TextEditingController();
  TextEditingController jamKeluar = TextEditingController();
  TextEditingController kehadiran = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // RxString url = ''.obs;
  updateVariable(Jadwal data) async {
    mapel.text = data.mapel;
    hari.text = data.hari;
    jamMasuk.text = data.jamMasuk;
    jamKeluar.text = data.jamKeluar;
    kehadiran.text = data.kehadiran;
  }

  updateJadwal(String id) async {
    CollectionReference reference = firestore.collection('jadwal');
    final jadwalData = {
      "mapel": mapel.text,
      "hari": hari.text,
      "jamMasuk": jamMasuk.text,
      "jamKeluar": jamKeluar.text,
      "kehadiran": kehadiran.text,
      // "harga": int.parse(harga.text),
      // "stok": int.parse(stok.text),
      // "jenis": jenis.text,
      // "gambar": url.value
    };
    try {
      DocumentReference absen = reference.doc(id);
      await absen.update(jadwalData);
      // await jadwal.doc(id).update(jadwalData);
      Get.defaultDialog(
          middleText: 'Berhasil mengupdate jadwal',
          confirm:
              ElevatedButton(onPressed: () => Get.back(), child: Text('Ok')));
      Get.offAllNamed(Routes.JADWAL);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate');
    }
  }
}
