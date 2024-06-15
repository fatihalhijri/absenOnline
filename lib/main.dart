// ignore_for_file: prefer_const_constructors

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:absenonline/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.SPLASH,//ganti splash
            // initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}


// // ignore_for_file: prefer_const_constructors

// import 'package:absenonline/app/controllers/auth_controller.dart';
// import 'package:absenonline/app/routes/app_pages.dart';
// import 'package:absenonline/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final auth = Get.put(AuthController());
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: auth.authStatus,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "Application",
//             initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
//             getPages: AppPages.routes,
//           );
//         } else {
//           return MaterialApp(
//             home: Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }