// ignore_for_file: avoid_print, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Dummy AttendanceController class
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var user = Rxn<User>();
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchUserName();
    user.bindStream(_auth.authStateChanges());
    // ever(user, handleAuthChanged);
  }

  // void handleAuthChanged(User? user) async {
  //   if (user != null) {
  //     DocumentSnapshot userDoc =
  //         await _firestore.collection('users').doc(user.uid).get();
  //     userName.value = userDoc['name'];
  //   }
  // }

  // void fetchUserName() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .get();
  //     userName.value = userDoc['name'];
  //   }
  // }
  void absenMasuk() {
    print('Absen Masuk');
    // Logika untuk absen masuk
  }

  void absenKeluar() {
    print('Absen Keluar');
    // Logika untuk absen keluar
  }

  void mulaiIstirahat() {
    print('Mulai Istirahat');
    // Logika untuk mulai istirahat
  }

  void selesaiIstirahat() {
    print('Selesai Istirahat');
    // Logika untuk selesai istirahat
  }

  void mulaiLembur() {
    print('Mulai Lembur');
    // Logika untuk mulai lembur
  }

  void selesaiLembur() {
    print('Selesai Lembur');
    // Logika untuk selesai lembur
  }
}

class RectangleController extends GetxController {
  String jamMasuk = '07 : 30';
  String jamKeluar = '01 : 40';

  void setJamMasuk(String jam) {
    jamMasuk = jam;
    update();
  }

  void setJamKeluar(String jam) {
    jamKeluar = jam;
    update();
  }
}
