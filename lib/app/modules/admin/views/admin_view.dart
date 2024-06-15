// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations, avoid_print, sized_box_for_whitespace

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/modules/admin/controllers/admin_controller.dart';
import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminView extends GetView<AdminController> {
  final AuthController _controller = Get.put(AuthController());
  // final AdminController _controllerAdmin = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: IconButton(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _controller.logout();
            },
          ),
        ],
      ),
      // body: Obx(() {
      //   return _controllerAdmin.schedules.isEmpty
      //       ? Center(
      //           child: Text(
      //             'No schedules available',
      //             style: TextStyle(fontSize: 18, color: Colors.grey),
      //           ),
      //         )
      //       : ListView.builder(
      //           itemCount: _controllerAdmin.schedules.length,
      //           itemBuilder: (context, index) {
      //             final schedule = _controllerAdmin.schedules[index];
      //             return Card(
      //               margin: EdgeInsets.all(8.0),
      //               elevation: 4.0,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: ListTile(
      //                 leading: Icon(Icons.schedule, color: Colors.indigo),
      //                 title: Text(schedule.title),
      //                 subtitle: Text(
      //                   '${schedule.dateTime.toLocal()}'.split(' ')[0],
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //                 trailing: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     IconButton(
      //                       icon: Icon(Icons.qr_code),
      //                       onPressed: () => _controllerAdmin.showQRCode(schedule),
      //                     ),
      //                     IconButton(
      //                       icon: Icon(Icons.edit),
      //                       onPressed: () => _controllerAdmin.showScheduleForm(schedule: schedule),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      // }),
      body: Obx(() => controller.status.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        var nomer = index + 1;
                        AbsenModel dt = controller.data[index];
                        print(
                            '----------------------------------------------------------------');
                        print('dasdasd ${controller.data}');


                        return Card(
                          margin: EdgeInsets.all(8.0),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'No: $nomer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama :  ${dt.nama}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800]),
                                    ),
                                    Text(
                                      'Kelas :  ${dt.kelas}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Status : ${dt.status ? "Hadir" : "Belum Hadir"}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'masuk :  ${dt.masuk}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'pulang :  ${dt.pulang}',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.qr_code),
                                      // onPressed: () => controller.showQRCode(schedule),
                                      onPressed: () => Get.offAllNamed(Routes.QR_SCANNER, arguments: dt),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () => Get.toNamed(
                                          Routes.EDIT_ABSEN,
                                          arguments: dt),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {Get.defaultDialog(
                                          title: 'Are you sure',
                                          middleText: 'Delete This Product',
                                          confirm: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              // onPressed: () => auth.logout(),
                                              onPressed: () => controller
                                                  .delete(dt.id),
                                              child: Text('Yes',
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          cancel: ElevatedButton(
                                              onPressed: () => Get.back(),
                                              child: Text('No')));
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : CircularProgressIndicator()
          // Center(
          //   child: SpinKitWave(
          //   color: Colors.blue,
          //   size: 50.0,
          // ),
          // ),
          ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => Get.offAllNamed(Routes.ADD_ABSEN),
            child: Icon(Icons.add),
            backgroundColor: Colors.indigo,
            heroTag: 'addSchedule',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => controller.scanQRCode(),
            child: Icon(Icons.qr_code_scanner),
            backgroundColor: Colors.indigo,
            heroTag: 'scanQRCode',
          ),
        ],
      ),
    );
  }
}
