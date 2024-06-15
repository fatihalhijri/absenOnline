// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAbsenController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController kelas = TextEditingController();
  TextEditingController masuk = TextEditingController();
  TextEditingController pulang = TextEditingController();
  RxBool status = false.obs;

  RxBool loadingStatus = false.obs;
  List<Jadwal> data = [];
  // TextEditingController gambar = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  saveProduct({AbsenModel? bukanschudle}) async {
    CollectionReference product = firestore.collection("absen");
    final productData = {
      //sini
      "nama": nama.text,
      "kelas": kelas.text,
      "status": status.value,
      "masuk": masuk.text,
      "pulang": pulang.text,
      // "gambar": url.value
    };
    try {
      await product.add(productData).then((value) {
        Get.defaultDialog(
            middleText: 'Berhasil Menambahkan Absen',
            confirm:
                ElevatedButton(onPressed: () => Get.back(), child: Text('Ok')));
      });
      Get.offAllNamed(Routes.ADMIN);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menambahkan Absen');
    }
  }

  getJadwal() async {
    final jadwal = await firestore.collection("jadwal").get();

    if (jadwal.docs.isNotEmpty) {
      jadwal.docs.map((e) {
        Jadwal jadwalList = Jadwal.fromJson(Map.from(e.data()), e.id);
        data.add(jadwalList);
      }).toList();
      loadingStatus.value = true;
    }
  }
}
