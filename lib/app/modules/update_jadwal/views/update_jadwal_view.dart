// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_jadwal_controller.dart';

class UpdateJadwalView extends GetView<UpdateJadwalController> {
   UpdateJadwalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Jadwal data = Get.arguments;
   controller.updateVariable(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateJadwalView'),
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
                  'Update Product',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mata Pelajaran',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  TextField(
                    controller: controller.mapel,
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
                    'hari',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.hari,
                    decoration: InputDecoration(
                        hintText: 'Ketikan hari ',
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
                    'jamMasuk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamMasuk,
                    decoration: InputDecoration(
                        hintText: 'Ketikan jamMasuk Anda',
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
                    'jamKeluar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamKeluar,
                    decoration: InputDecoration(
                        hintText: 'Ketikan jamKeluar Anda',
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
                    'kehadiran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.kehadiran,
                    decoration: InputDecoration(
                        hintText: 'Ketikan kehadiran Anda',
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
              ElevatedButton(
                  onPressed: () {
                    controller.updateJadwal(data.id);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save Product"),
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ))
            ],
          ),
        ));
    
  }
}
