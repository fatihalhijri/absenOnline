// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/modules/product/model/productModel.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);

  final srt = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    // final String docId = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('ProductView'),
          centerTitle: true,
        ),
        // body: Obx(
        //   () => controller.status.value ?
        //   SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: DataTable(
        //       columns: [
        //         DataColumn(label: Text('No')),
        //         DataColumn(label: Text('Nama')),
        //         DataColumn(label: Text('Harga')),
        //         DataColumn(label: Text('Stok')),
        //         DataColumn(label: Text('ubah')),
        //       ],
        //       rows: List.generate(controller.data.length, (index) {
        //         var nomer = index + 1;
        //         Product dt = controller.data[index];
        //         return DataRow(cells: [
        //           DataCell(Text('$nomer')),
        //           DataCell(Text(dt.nama)),
        //           DataCell(Text(dt.harga.toString())),
        //           DataCell(Text(dt.stok.toString())),
        //           // DataCell(Text('2000')),
        //           DataCell(Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(Icons.edit),
        //                 color: Colors.blue,
        //               ),
        //               IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(Icons.delete),
        //                 color: Colors.red,
        //               ),
        //             ],
        //           )),
        //         ]);
        //       })),
        // ):Center(
        // child: CircularProgressIndicator(),
        // )
        // ),
        //style ke 2
        //  body: Obx(
        //     () => controller.status.value ?
        //     SingleChildScrollView(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Column(
        //           children: List.generate(controller.data.length, (index) {
        //             var nomer = index + 1;
        //             Product dt = controller.data[index];
        //             return Card(
        //               margin: EdgeInsets.symmetric(vertical: 8.0),
        //               elevation: 3,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(16.0),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'No: $nomer',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                     SizedBox(height: 8),
        //                     Text(
        //                       'Nama: ${dt.nama}',
        //                       style: TextStyle(
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                     SizedBox(height: 8),
        //                     Text(
        //                       'Harga: Rp ${dt.harga}',
        //                       style: TextStyle(
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                     SizedBox(height: 8),
        //                     Text(
        //                       'Stok: ${dt.stok}',
        //                       style: TextStyle(
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                     SizedBox(height: 16),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.end,
        //                       children: [
        //                         IconButton(
        //                           onPressed: () {},
        //                           icon: Icon(Icons.edit),
        //                           color: Colors.blue,
        //                         ),
        //                         IconButton(
        //                           onPressed: () {},
        //                           icon: Icon(Icons.delete),
        //                           color: Colors.red,
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           }),
        //         ),
        //       ),
        //     ) : Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   ),

        //style ke 3
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
                      Product dt = controller.data[index];
                      return Card(
                        margin: EdgeInsets.all(4.0),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No: $nomer',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Nama: ${dt.nama}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Harga: Rp ${dt.harga}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Stok: ${dt.stok}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'jenis: ${dt.jenis}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              // Text(
                              //   'gambar: ${dt.gambar}',
                              //   style: TextStyle(
                              //     fontSize: 16,
                              //     color: Colors.grey[700],
                              //   ),
                              // ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => Get.offAllNamed(
                                        Routes.UPDATE_PRODUCT,
                                        arguments: dt),
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
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
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 50),
                                      backgroundColor: Colors.blue),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Add To Cart'),
                                      Icon(
                                        CupertinoIcons.cart,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.offAllNamed(Routes.ADD_PRODUCT),
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ));
  }
}
