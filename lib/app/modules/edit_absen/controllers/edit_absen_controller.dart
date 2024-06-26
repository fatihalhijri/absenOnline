// ignore_for_file: unnecessary_overrides

import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAbsenController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController nama = TextEditingController();
  TextEditingController kelas = TextEditingController();
  TextEditingController masuk = TextEditingController();
  TextEditingController pulang = TextEditingController();
  RxBool status = false.obs;

  updateVar (AbsenModel data) async {
    nama.text = data.nama;
    kelas.text = data.kelas;
    status.value = status.value;
    masuk.text = data.masuk;
    pulang.text = data.pulang;
  }

  updateAbsen (String id) async {
    CollectionReference reference = firestore.collection("absen");
    
    final absenData = {
      "nama": nama.text,
      "kelas": kelas.text,
      "status": status.value,
      "masuk": masuk.text,
      "pulang": pulang.text,
    };

    try {
      DocumentReference absen = reference.doc(id);

      await absen.update(absenData);
      Get.defaultDialog(middleText: "Berhasil Mengubah Absensi",);
        Get.offAllNamed(Routes.ADMIN);
    } catch (e) {
      Get.defaultDialog(middleText: "Gagal Mengubah Absensi",);
    }
  }

}
