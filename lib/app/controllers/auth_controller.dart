// ignore_for_file: unnecessary_overrides, unused_local_variable, avoid_print, prefer_const_constructors, non_constant_identifier_names, empty_catches, unused_import, unnecessary_brace_in_string_interps

import 'package:absenonline/app/modules/admin/model/users.model.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:latihan_firebase/app/routes/app_pages.dart';
// import 'package:latihan_firebase_asli/app/routes/app_pages.dart';

class AuthController extends GetxController {
  String codeOtp = "";
  
  RxBool status = false.obs;

  Stream authStatus = FirebaseAuth.instance.authStateChanges();
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  List<UserModel> data = [];
  register(String nama,String email, String password, String konfirmasiPassword) async {
    if (password != konfirmasiPassword) {
      Get.defaultDialog(
          title: 'Perhatian',
          middleText: 'password tidak sama',
          confirm:
              ElevatedButton(onPressed: () => Get.back(), child: Text('OK')));
      return;
    }
    try {
      Get.defaultDialog(content: CircularProgressIndicator(), title: 'Loading');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
        // konfirmasiPassword: konfirmasiPassword,
        
      );
      // Simpan nama pengguna ke Firestore
      await fs.collection('users').doc(credential.user!.uid).set({
        'name': nama,
        'email': email,
        'dibuat_pada': Timestamp.now(),
      });
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    } finally {
      Get.back();
    }
  }

   getNama() async {
    try {
      status.value = false;
      final absen = await fs.collection("users").get();

      print(absen);

      if (absen.docs.isNotEmpty) {
        absen.docs.map((e) {
          UserModel absenList = UserModel.fromJson(
            Map.from(e.data()), //e.id
          );
          data.add(absenList);
        }).toList();
        status.value = true;
      }
    } catch (e) {
      print('err ${e}');
    }
  }

  login(String email, String password) async {
    try {
      Get.defaultDialog(content: CircularProgressIndicator(), title: 'Loading');
      final credential =
          // await FirebaseAuth.instance.createUserWithEmailAndPassword(
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      try {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        Get.defaultDialog(middleText: "Gagal Login Google", title: "Error");
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  resetpass(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
          middleText: 'Email Terkirim!,Silahkan Cek Email Anda',
          confirm: ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.LOGIN),
              child: Text('Ok')));
    } catch (e) {
      Get.defaultDialog(
          middleText: "Gagal mengirim email",
          confirm: ElevatedButton(onPressed: () {}, child: Text('ok')));
    }
  }

  sendOtp(String nomer) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+62$nomer',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Get.toNamed(Routes.HOME);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.defaultDialog(middleText: 'Gagal mengirim OTP!');
        },
        codeSent: (String verificationId, int? resendToken) {
          codeOtp = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          codeOtp = verificationId;
        },
        timeout: Duration(seconds: 60));
    Get.toNamed(Routes.OTP);
  }

  cekOtp(String codeSms) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: codeOtp, smsCode: codeSms))
          .then((value) {
        if (value.user != null) {
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.defaultDialog(middleText: 'Code Otp salah');
    }
  }
}
