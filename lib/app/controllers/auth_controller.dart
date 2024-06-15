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
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);
  RxString userRole = ''.obs;
  RxString userName = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  RxBool status = false.obs;

  Stream authStatus = FirebaseAuth.instance.authStateChanges();
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  List<UserModel> data = [];
  register(String name,String email, String password, String konfirmasiPassword,String role) async {
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
       User? user = credential.user;
      // Simpan nama pengguna ke Firestore
     if(user != null){
      await user.updateDisplayName(name);
       await fs.collection('users').doc(credential.user!.uid).set({
        'uid': user.uid,
        'name': name,
        'email': email,
        'role':role,
        'dibuat_pada': Timestamp.now(),
      });
     }
      Get.offAllNamed(Routes.LOGIN);
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
  //  register(String email, String password, String konfirmasiPassword,String name, String role) async {
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User? user = userCredential.user;

  //     if (user != null) {
  //       await user.updateDisplayName(name);
  //       await firestore.collection('users').doc(user.uid).set({
  //         'uid': user.uid,
  //         'email': email,
  //         'name': name,
  //         'role': role, // Add role here
  //       });
  //     }
  //     Get.offAllNamed(Routes.LOGIN);
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

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
      
      User? user = credential.user;
      Get.offAllNamed(Routes.HOME);
      if (user != null) {
        DocumentSnapshot userDoc = await firestore.collection('users').doc(user.uid).get();
        userRole.value = userDoc['role'];
        userName.value = userDoc['name'];

        if (userRole.value == 'admin') {
          Get.offAllNamed(Routes.ADMIN);
        } else {
          Get.offAllNamed(Routes.USER);
        }
      }

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
  // void login(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User? user = userCredential.user;

  //     if (user != null) {
  //       DocumentSnapshot userDoc = await firestore.collection('users').doc(user.uid).get();
  //       userRole.value = userDoc['role'];
  //       userName.value = userDoc['name'];

  //       if (userRole.value == 'admin') {
  //         Get.offAllNamed(Routes.ADMIN);
  //       } else {
  //         Get.offAllNamed(Routes.USER);
  //       }
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }


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
  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email sent');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
