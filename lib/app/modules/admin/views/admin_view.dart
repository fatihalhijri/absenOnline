// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/modules/admin/controllers/admin_controller.dart';
import 'package:absenonline/app/modules/admin/model/admin.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AdminView extends GetView<AdminController> {
  final AuthController _controller = Get.put(AuthController());
  // final AdminController _controllerAdmin = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Admin Page'),
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
      body: Obx(
        () => controller.status.value
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      var nomer = index + 1;
                      AbsenModel dt = controller.data[index];
                      return
                          // Card(
                          //   margin: EdgeInsets.all(4.0),
                          //   elevation: 5,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(16.0),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'No: $nomer',
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 16,
                          //             color: Colors.grey[800],
                          //           ),
                          //         ),
                          //         SizedBox(height: 8),
                          //         Text(
                          //           'Nama: ${dt.nama}',
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             color: Colors.grey[700],
                          //           ),
                          //         ),
                          //         SizedBox(height: 8),
                          //         // Text(
                          //         //   'Harga: Rp ${dt.harga}',
                          //         //   style: TextStyle(
                          //         //     fontSize: 16,
                          //         //     color: Colors.grey[700],
                          //         //   ),
                          //         // ),
                          //         SizedBox(height: 8),
                          //         Text(
                          //           '${dt.status}',
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             color: Colors.grey[700],
                          //           ),
                          //         ),
                          //         SizedBox(height: 8),
                          //         Text(
                          //           'jenis: ${dt.kelas}',
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             color: Colors.grey[700],
                          //           ),
                          //         ),
                          //         SizedBox(height: 8),
                          //         // Text(
                          //         //   'gambar: ${dt.gambar}',
                          //         //   style: TextStyle(
                          //         //     fontSize: 16,
                          //         //     color: Colors.grey[700],
                          //         //   ),
                          //         // ),
                          //         Spacer(),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             IconButton(
                          //               onPressed: () => Get.offAllNamed(
                          //                   Routes.UPDATE_PRODUCT,
                          //                   arguments: dt),
                          //               icon: Icon(Icons.edit),
                          //               color: Colors.blue,
                          //             ),
                          //             // IconButton(
                          //             //   onPressed: () {
                          //             //     // controller.deleteProduct(
                          //             //     //     controller.data[index].id);
                          //             //     Get.defaultDialog(
                          //             //         title: 'Are you sure',
                          //             //         middleText: 'Delete This Product',
                          //             //         confirm: ElevatedButton(
                          //             //             style: ElevatedButton.styleFrom(
                          //             //                 backgroundColor: Colors.red),
                          //             //             // onPressed: () => auth.logout(),
                          //             //             onPressed: () => controller
                          //             //                 .deleteProduct(dt.id),
                          //             //             child: Text('Yes',
                          //             //                 style: TextStyle(
                          //             //                     color: Colors.white))),
                          //             //         cancel: ElevatedButton(
                          //             //             onPressed: () => Get.back(),
                          //             //             child: Text('No')));
                          //             //   },
                          //             //   icon: Icon(Icons.delete),
                          //             //   color: Colors.red,
                          //             // ),
                          //           ],
                          //         ),
                          //         ElevatedButton(
                          //             onPressed: () {},
                          //             style: ElevatedButton.styleFrom(
                          //                 minimumSize: Size(double.infinity, 50),
                          //                 backgroundColor: Colors.blue),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Text('Add To Cart'),
                          //                 Icon(
                          //                   CupertinoIcons.cart,
                          //                   color: Colors.white,
                          //                   size: 20,
                          //                 )
                          //               ],
                          //             ))
                          //       ],
                          //     ),
                          //   ),
                          // );
                          Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: ListTile(

                        //   // leading: Icon(Icons.schedule, color: Colors.indigo),
                        //   leading: Text(
                        //             'No: $nomer',
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 16,
                        //               color: Colors.grey[800],
                        //             ),
                        //           ),
                        //   title: Text(dt.nama),

                        //   subtitle: Text(
                        //     '${dt.status}',
                        //     style: TextStyle(fontSize: 16),
                        //   ),
                        //   trailing: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       // IconButton(
                        //       //   icon: Icon(Icons.qr_code),
                        //       //   onPressed: () => controller.showQRCode(schedule),
                        //       // ),
                        //       IconButton(
                        //         icon: Icon(Icons.edit),
                        //         onPressed: () => Get.offAllNamed(Routes.EDIT_ABSEN),
                        //       ),
                        //     ],
                        //   ),
                        // )
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
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[800]),
                                  ),
                                  Text(
                                    'Kelas :  ${dt.kelas}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Status : ${dt.status}',
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
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () =>
                                        Get.offAllNamed(Routes.EDIT_ABSEN),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : Center(
              child: SpinKitWave(
              color: Colors.blue,
              size: 50.0,
            ),
            ),
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
