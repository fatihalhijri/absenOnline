// ignore_for_file: unnecessary_overrides, empty_catches, prefer_const_constructors, unused_import, unnecessary_brace_in_string_interps, avoid_web_libraries_in_flutter

import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddProductController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController jenis = TextEditingController();
  // TextEditingController gambar = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString url = ''.obs;
  saveProduct() async {
    CollectionReference product = firestore.collection("product");
    final productData = {
      "nama": nama.text,
      "harga": int.parse(harga.text),
      "stok": int.parse(stok.text),
      "jenis": jenis.text,
      // "gambar": url.value
    };
    try {
      await product.add(productData).then((value) {
        Get.defaultDialog(
            middleText: 'Berhasil Menambahkan Product',
            confirm:
                ElevatedButton(onPressed: () => Get.back(), child: Text('Ok')));
      });
      Get.offAllNamed(Routes.PRODUCT);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menambahkan Product');
    }
  }

  // uploadFoto() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     // File file = File(result.files.single.path!);
  //     //bawah untuk web dan atas untuk hp
  //     Uint8List fileBytes = result.files.first.bytes!;
  //     String fileName = result.files.first.name;
  //     url.value = fileName;
  //     FirebaseStorage fireStorage = FirebaseStorage.instance;

  //     try {
  //       await fireStorage.ref('product/${fileName}').putData(fileBytes);
  //       final dataUrl =
  //           await fireStorage.ref('product/${fileName}').getDownloadURL();
  //       url.value = dataUrl;
  //     } catch (e) {
  //       Get.defaultDialog(middleText: 'gagal mengupload file');
  //     }
  //   } else {
  //     Get.defaultDialog(middleText: 'gagal mengupload file');
  //   }
  // }

  
}
