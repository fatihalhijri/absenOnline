// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_print, sort_child_properties_last

import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        // centerTitle: true,
      ),
      

      body: Obx(
        () => controller.status.value
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dua kolom
                      childAspectRatio:
                          0.75, // Rasio aspek untuk mengatur tinggi dan lebar item
                      crossAxisSpacing: 8.0, // Jarak horizontal antar item
                      mainAxisSpacing: 8.0, // Jarak vertikal antar item
                    ),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      var nomer = index + 1;
                      Jadwal dt = controller.data[index];
                      print(
                          '----------------------------------------------------------------');
                      print('dasdasd ${controller.data}');
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '$nomer',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    '${dt.hari}',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Mata Pelajaran :  ${dt.mapel}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Status Kehadiran : ${dt.kehadiran}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Jam masuk :  ${dt.jamMasuk}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Jam pulang :  ${dt.jamKeluar}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      Get.toNamed(Routes.QR_SCANNER,arguments: dt.id);
                                    },
                                    child: Icon(Icons.qr_code),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      Get.toNamed(Routes.UPDATE_JADWAL,
                                          arguments: dt);
                                    },
                                    child: Icon(Icons.update),
                                    // onPressed: () => controller.showQRCode(schedule),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      // controller.deleteProduct(
                                      //     controller.data[index].id);
                                      Get.defaultDialog(
                                          title: 'Are you sure',
                                          middleText: 'Delete This Product',
                                          confirm: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              // onPressed: () => auth.logout(),
                                              onPressed: () => controller
                                                  .deleteProduct(dt.id),
                                              child: Text('Yes',
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          cancel: ElevatedButton(
                                              onPressed: () => Get.back(),
                                              child: Text('No')));
                                    },

                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),

                                    // onPressed: () => controller.showQRCode(schedule),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => Get.toNamed(Routes.ADD_JADWAL),
            child: Icon(Icons.add),
            backgroundColor: Colors.indigo,
            heroTag: 'addSchedule',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            // onPressed: () => controller.scanQRCode(),/
            onPressed: () {},
            child: Icon(Icons.qr_code_scanner),
            backgroundColor: Colors.indigo,
            heroTag: 'scanQRCode',
          ),
        ],
      ),
    );
  }
}
