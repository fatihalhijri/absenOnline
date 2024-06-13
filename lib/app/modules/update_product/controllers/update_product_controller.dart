// ignore_for_file: unnecessary_overrides, prefer_const_constructors, empty_catches, unused_import


import 'package:absenonline/app/modules/product/model/productModel.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController jenis = TextEditingController();
  TextEditingController stok = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString url = ''.obs;
  updateVariable(Product data) async {
    nama.text = data.nama;
    harga.text = data.harga.toString();
    stok.text = data.stok.toString();
    jenis.text = data.jenis;
    url.value = data.gambar;
  }

  updateProduct(String id) async {
    // DocumentReference product = firestore.collection("product").doc(data);
    // final productData = {
    //   "nama" :nama.text,
    //   "harga":int.parse(harga.text),
    //   "stok":int.parse(stok.text),
    //   "jenis":jenis.text
    // };
    CollectionReference product = firestore.collection('product');
    final productData = {
      "nama": nama.text,
      "harga": int.parse(harga.text),
      "stok": int.parse(stok.text),
      "jenis": jenis.text,
      "gambar": url.value
    };
    try {
      await product.doc(id).update(productData);
      Get.defaultDialog(middleText: 'Berhasil mengupdate Product',confirm: ElevatedButton(onPressed: () =>Get.back(), child: Text('Ok')));
      Get.offAllNamed(Routes.PRODUCT);
      
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate');
    }

    // try {
    //   await product.update(productData).then((value) {
    //     Get.defaultDialog(middleText:'Berhasil Mengupdate Product',
    //     confirm: ElevatedButton(onPressed: () =>Get.back(), child: Text('Ok')) );
    //   });
    //     Get.offAllNamed(Routes.PRODUCT);

    // }catch(e){
    //   Get.defaultDialog(middleText: 'Gagal MengUpdate Product');
    // }
  }
  //controller menghapus data pada page product
}
