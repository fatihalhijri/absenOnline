// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/homemain_controller.dart';

// class HomemainView extends GetView<HomemainController> {
//   const HomemainView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomemainView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'HomemainView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class HomemainView extends StatefulWidget {
  const HomemainView({Key? key}) : super(key: key);

  @override
  _HomemainViewState createState() => _HomemainViewState();
}

class _HomemainViewState extends State<HomemainView> {
  final HomemainController controller = Get.put(HomemainController());
  int menu = 0;
  List lsMenu = [Routes.HOME, Routes.ADMIN, Routes.ABSEN, Routes.PRODUCT];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomemainView'),
        centerTitle: true,
      ),
      body: lsMenu[menu],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            padding: EdgeInsets.all(10),
            gap: 8,
            onTabChange: (value) {
              setState(() {
                menu = value;
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.near_me, text: "Booking"),
              GButton(icon: Icons.favorite, text: "Favorit"),
              GButton(icon: Icons.person, text: "Profile"),
            ]),
      ),
    );
  }
}
