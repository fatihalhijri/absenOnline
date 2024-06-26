// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/modules/edit_absen/controllers/edit_absen_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditAbsenView extends GetView<EditAbsenController> {
  const EditAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AbsenModel data = Get.arguments;
    controller.updateVar(data);
    return Scaffold(
        appBar: AppBar(
          title: const Text('EditAbsenView'),
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
                  Text('Nama Anda',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  TextField(
                    controller: controller.nama,
                    decoration: InputDecoration(
                        hintText: 'Ketikan Nama  Anda',
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
                    'Masukan Kelas anda',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.kelas,
                    decoration: InputDecoration(
                        hintText: 'Kelas',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text('Belum Hadir'),
                      SizedBox(
                        width: 5,
                      ),
                      Obx(() => Switch(
                            value: controller.status.value,
                            onChanged: (value) {
                              controller.status.value = value;
                              print(value);
                            },
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Hadir')
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.masuk,
                    decoration: InputDecoration(
                        hintText: 'Jam Masuk',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keluar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    controller: controller.pulang,
                    decoration: InputDecoration(
                        hintText: 'Jam keluar',
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
                    controller.updateAbsen(data.id);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save Absen"),
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
