// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:absenonline/app/modules/add_jadwal/controllers/add_jadwal_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddJadwalView extends GetView<AddJadwalController> {
  const AddJadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddJadwalView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Product',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  TextField(
                    controller: controller.hari,
                    decoration: InputDecoration(
                        hintText: 'Ketikan Nama Product Anda',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'harga',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.hari,
                    decoration: InputDecoration(
                        hintText: 'Ketikan harga ',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'stok',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamKeluar,
                    decoration: InputDecoration(
                        hintText: 'Ketikan stok Anda',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'jenis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamMasuk,
                    decoration: InputDecoration(
                        hintText: 'Ketikan jenis Anda',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'jenis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.kehadiran,
                    decoration: InputDecoration(
                        hintText: 'Ketikan jenis Anda',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Obx(() => Text(controller.url.value),),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin: EdgeInsets.symmetric(vertical: 20),
              //   child: ElevatedButton(
              //     onPressed: ()=>controller.uploadFoto(),
              //     child: Text('upload File'),
              //   ),
              // ),
              ElevatedButton(
                  onPressed: () {
                    controller.saveJadwal();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save Product"),
                      Icon(Icons.add,size: 20, color: Colors.white,)
                    ],
                  ))
            ],
          ),
        ));
  }
}
