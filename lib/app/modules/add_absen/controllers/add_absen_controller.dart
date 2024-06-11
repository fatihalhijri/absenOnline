// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAbsenController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController status = TextEditingController();
  // TextEditingController stok = TextEditingController();
  TextEditingController kelas = TextEditingController();
  // TextEditingController gambar = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  saveProduct({AbsenModel? bukanschudle}) async {
    CollectionReference product = firestore.collection("absen");
    final productData = {
      //sini
      "nama": nama.text,
      "status": nama.text,
      "jenis": kelas.text,
      // "gambar": url.value
    };
    try {
      await product.add(productData).then((value) {
        Get.defaultDialog(
            middleText: 'Berhasil Menambahkan Product',
            confirm:
                ElevatedButton(onPressed: () => Get.back(), child: Text('Ok')));
      });
      Get.offAllNamed(Routes.ADMIN);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menambahkan Product');
    }
  }
}
