// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:absenonline/app/modules/add_jadwal/controllers/add_jadwal_controller.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddJadwalView extends GetView<AddJadwalController> {
  const AddJadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal View'),
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
                  'Buat Jadwal ',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Mata Pelajaran',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  TextField(
                    controller: controller.mapel,
                    decoration: InputDecoration(
                        hintText: 'Ketikan Mapel Anda',
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
              
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Hari',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.hari,
                    decoration: InputDecoration(
                        hintText: 'Ketikan Hari ',
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
                    'jam Masuk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamMasuk,
                    decoration: InputDecoration(
                        hintText: 'Ketikan jam Masuk Anda',
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
                    'Jam Keluar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.jamKeluar,
                    decoration: InputDecoration(
                        hintText: 'Ketikan Jam Keluar Anda',
                        filled: true,
                        fillColor: Colors.white,
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
                      Text("Save Jadwal"),
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
