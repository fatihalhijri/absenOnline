// // ignore_for_file: prefer_const_constructors

// import 'package:absenonline/app/controllers/auth_controller.dart';
// import 'package:absenonline/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//    HomeView({Key? key}) : super(key: key);
//   final auth = Get.put(AuthController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomeView'),
//           centerTitle: true,
//         ),
//         body: Column (
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//         IconButton(
//           onPressed: () {
//             Get.defaultDialog(
//                 title: 'are you sure',
//                 middleText: 'log out this aplication',
//                 confirm: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red),
//                     // onPressed: () => auth.logout(),
//                     onPressed: () => auth.logout(),
//                     child:
//                         Text('Yes', style: TextStyle(color: Colors.white))),
//                 cancel: ElevatedButton(
//                     onPressed: () => Get.back(), child: Text('No')));
//           },
//           icon: Icon(Icons.logout),
//         ),
//         ElevatedButton(
//             onPressed: () => Get.toNamed(Routes.PRODUCT,),
//             style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 backgroundColor: Colors.blue),
//             child: Text('Halaman Product')),
//         ElevatedButton(
//             onPressed: () => Get.toNamed(Routes.KASIR,),
//             style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 backgroundColor: Colors.blue),
//             child: Text('Halaman Kasir')),
//           ],
//         ));
//   }
// }

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unused_local_variable

// import 'dart:io';

import 'dart:async';

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/modules/home/controllers/home_controller.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());

  final auth = Get.put(AuthController());

  final User? user = FirebaseAuth.instance.currentUser;

  final recta = Get.put(RectangleController());

  DateTime sekarang = DateTime.now();
  String jamSekarang = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        sekarang = DateTime.now();
        jamSekarang =
            '${sekarang.hour} : ${sekarang.minute} : ${sekarang.second}';
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime sekarang = DateTime.now();
    // String jamSekarang = '${sekarang.hour}:${sekarang.minute}';
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'AbsenOnline',
      //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.indigo,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.account_circle),
      //       onPressed: () {
      //         _showProfileDialog(context);
      //       },
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        title: Text('AbsenOnline'),
        actions: [
          // Profile Icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Handle profile tap
              },
              child: Row(
                children: [
                  Text('${user?.email}'),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : AssetImage('public/profilekartun.png')
                            as ImageProvider,
                  ),
                ],
              ),
            ),
          ),
          // Menu Icon
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit profile
                Get.snackbar('Profile Anda', ' Telah DiperbaruI');
              } else if (value == 'logout') {
                // auth.logout();
                Get.defaultDialog(
                    title: 'are you sure',
                    middleText: 'log out this aplication',
                    confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        // onPressed: () => auth.logout(),
                        onPressed: () => auth.logout(),
                        child:
                            Text('Yes', style: TextStyle(color: Colors.white))),
                    cancel: ElevatedButton(
                        onPressed: () => Get.back(), child: Text('No')));
                Get.offAllNamed('/login');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Log Out'),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        'Hai, ${controller.userName}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
                  SizedBox(height: 8),
                  Text(
                    'Waktunya kamu Absensi!',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              // Container(
              //   width: 400,
              //   decoration: BoxDecoration(color: Colors.blue[800]),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(children: [
              //       Text(hariIni?.tanggal ?? '-',
              //           style: TextStyle(color: Colors.white, fontSize: 16)),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Column(
              //             children: [
              //               Text(hariIni?.masuk ?? '-',
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 24)),
              //               Text("Masuk",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 16))
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               Text(hariIni?.pulang ?? '-',
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 24)),
              //               Text("Pulang",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 16))
              //             ],
              //           )
              //         ],
              //       )
              //     ]),
              //   ),
              // ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jam Sekarang',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        Text('$jamSekarang',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 70,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${recta.jamMasuk}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24)),
                              Text("Masuk",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${recta.jamKeluar}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24)),
                              Text("Masuk",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Jam Sekarang: ${DateTime.now()}',
              //         style: TextStyle(fontSize: 20),
              //       ),
              //       SizedBox(height: 20),
              //       Text(
              //         'Jam Masuk: ${recta.jamMasuk}',
              //         style: TextStyle(fontSize: 20),
              //       ),
              //       SizedBox(height: 20),
              //       Text(
              //         'Jam Keluar: ${recta.jamKeluar}',
              //         style: TextStyle(fontSize: 20),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),
              SizedBox(height: 32),
              Container(
                height: 180,
                child: PageView(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('public/google.png', height: 100),
                          Center(
                            child: Text(
                              'Dapatkan bimbingan dalam kerja,\nsetelah Anda Absen Diri Anda!',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('public/google.png', height: 100),
                          Center(
                            child: Text(
                              'Perhatian! Event AbsenOnline Kemabli \nakan Diadakan 1 Juli 2024!',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.ADMIN);
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login, size: 48, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            'Absen Sekarang',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildMenuButton(
                    context,
                    'Absen Keluar',
                    Icons.logout,
                    controller.absenKeluar,
                  ),
                  _buildMenuButton(
                    context,
                    'Mulai Istirahat',
                    Icons.free_breakfast,
                    controller.mulaiIstirahat,
                  ),
                  _buildMenuButton(
                    context,
                    'Selesai Istirahat',
                    Icons.alarm_off,
                    controller.selesaiIstirahat,
                  ),
                  _buildMenuButton(
                    context,
                    'Mulai Lembur',
                    Icons.work,
                    controller.mulaiLembur,
                  ),
                  _buildMenuButton(
                    context,
                    'Selesai Lembur',
                    Icons.work_off,
                    controller.selesaiLembur,
                  ),
                  _buildMenuButton(
                    context,
                    'Riwayat Absensi',
                    Icons.history,
                    _showHistoryDialog,
                  ),
                  _buildMenuButton(
                    context,
                    'Pengaturan',
                    Icons.settings,
                    _showSettingsDialog,
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  _showSummaryDialog(context);
                },
                icon: Icon(Icons.abc),
                label: Text('Ringkasan Absensi'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _showHelpDialog(context);
                },
                icon: Icon(Icons.help),
                label: Text('Bantuan'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 32),
              // Tambahkan komponen baru di sini
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Text(
                      'Komponen Baru',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ini adalah komponen baru yang ditambahkan di bawah.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String title, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.ADMIN);
        // _showFeatureDialog(
        //     context, title, 'Anda telah mengklik tombol $title.');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.green),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Absensi'),
            onTap: () {
              _showHistoryDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
            onTap: () {
              _showSettingsDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Bantuan'),
            onTap: () {
              _showHelpDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFeatureDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profil Pengguna'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
              ),
              SizedBox(height: 16),
              Text('zizzz'),
              Text('abdulaziizz817@gmail.com'),
              ElevatedButton(
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    CroppedFile? croppedFile = await ImageCropper().cropImage(
                      sourcePath: image.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
                      cropStyle:
                          CropStyle.rectangle, // Atur gaya cropper di sini
                      compressQuality:
                          100, // Atur kualitas kompresi gambar (0 hingga 100)
                      compressFormat:
                          ImageCompressFormat.jpg, // Format kompresi gambar

                      //MASIH ERROR

                      // androidUiSettings: AndroidUiSettings(
                      //   toolbarTitle: 'Cropper',
                      //   toolbarColor: Colors.deepOrange,
                      //   toolbarWidgetColor: Colors.white,
                      //   initAspectRatio: CropAspectRatioPreset.original,
                      //   lockAspectRatio: false,
                      // ),
                      // iosUiSettings: IOSUiSettings(
                      //   minimumAspectRatio: 1.0,
                      // ),
                    );
                    if (croppedFile != null) {
                      // Gunakan croppedFile untuk update avatar pengguna
                    }
                  }
                },
                child: Text('Pilih dan Crop Gambar Profil'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Keluar'),
              onPressed: () {
                Navigator.of(context).pop();
                // Tambahkan logika logout di sini
              },
            ),
          ],
        );
      },
    );
  }

  void _showHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Riwayat Absensi'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10, // Ganti dengan jumlah riwayat absensi sebenarnya
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Absensi ${index + 1}'),
                  subtitle: Text('Detail absensi ke-${index + 1}'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengaturan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: Text('Notifikasi'),
                value: true, // Ganti dengan nilai sebenarnya dari pengaturan
                onChanged: (bool value) {
                  // Tambahkan logika pengaturan notifikasi di sini
                },
              ),
              SwitchListTile(
                title: Text('Tema Gelap'),
                value: false, // Ganti dengan nilai sebenarnya dari pengaturan
                onChanged: (bool value) {
                  // Tambahkan logika pengaturan tema di sini
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSummaryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ringkasan Absensi'),
          content: Text(
              'Berikut adalah ringkasan absensi Anda selama bulan ini: \n\n'
              '- Absen Masuk: 20 kali\n'
              '- Absen Keluar: 20 kali\n'
              '- Istirahat: 10 kali\n'
              '- Lembur: 5 kali'),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bantuan'),
          content: Text(
              'Jika Anda membutuhkan bantuan, silakan hubungi tim dukungan kami.'),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
