import 'package:absenonline/app/modules/admin/model/admin.model.dart';
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
          icon: Icon(Icons.arrow_back)
        ),
        backgroundColor: Colors.blue,
        // centerTitle: true,
      ),
      body: Obx(() => controller.status.value
      ? Container(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Hari')),
            DataColumn(label: Text('Mapel')),
            DataColumn(label: Text('Jam Masuk')),
            DataColumn(label: Text('Jam Keluar')),
            DataColumn(label: Text('Kehadiran')),
          ], 
          rows: List.generate(
            controller.data.length, (index) {
            Jadwal dt = controller.data[index];
            return DataRow(cells: [
              DataCell(Text((index + 1).toString())),
              DataCell(Text('${dt.hari}')),
              DataCell(Text('${dt.mapel}')),
              DataCell(Text('${dt.jamMasuk}')),
              DataCell(Text('${dt.jamKeluar}')),
              DataCell(Text('${dt.kehadiran}')),
            ]);
            } 
          )
        )
      )
      : CircularProgressIndicator(),
      ),
    );
  }
}
