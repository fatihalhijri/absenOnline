// ignore_for_file: unnecessary_overrides, avoid_print, prefer_const_constructors, empty_catches, await_only_futures

import 'package:absenonline/app/modules/product/model/productModel.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Product> data = [];

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }
  //untuk get data yg diatas

  getProduct() async {
    final product = await firestore.collection('absen').get();
    if (product.docs.isNotEmpty) {
      print(product.docs);
      product.docs.map((e) {
        print(e.data());
        print(e.id);
        Product productList = Product.fromJson(Map.from(e.data()), e.id);
        data.add(productList);
      }).toList();
      status.value = true;
    }
  }

  

  deleteProduct(String id) async {
    // DocumentReference product = firestore.collection("product").doc(id);
    // try {
    //   await product.delete().then((value){
    //     Get.defaultDialog(
    //       middleText: 'Berhasil Menghapus Product',
    //        confirm: ElevatedButton(onPressed: () {
    //           Get.back();
    //         }, child: Text('Ok'))
    //     );
    //     Get.offAllNamed(Routes.PRODUCT);
    //   }
    //   );
    // }catch(e){
    //     Get.defaultDialog(middleText: 'Gagal Menghapus Product');
    //   }

    //diatas cara gpt

    try {
      await firestore.collection('product').doc(id).delete();
      Get.defaultDialog(
          middleText: 'Berhasil Menghapus Product',
          confirm: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Ok')));
      Get.offAllNamed(Routes.PRODUCT);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menghapus Product');
    }
  }
}
