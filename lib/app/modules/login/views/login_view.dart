// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, prefer_final_fields

// import 'package:absenonline/app/controllers/auth_controller.dart';
// import 'package:absenonline/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   LoginView({Key? key}) : super(key: key);
//   bool _isObscure = true;
//   final auth = Get.put(AuthController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'Login',
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Email',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//               TextField(
//                 controller: controller.email,
//                 decoration: InputDecoration(
//                     hintText: 'Ketikan Email Anda',
//                     hintStyle:
//                         TextStyle(fontSize: 18, color: Colors.grey.shade400),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8)),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.yellow))),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,

//             children: [
//               Text(
//                 'Password',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//               ),
//               TextField(
//                 controller: controller.password,
//                 obscureText: _isObscure,
//                 onSubmitted: (value) =>
//                     auth.login(controller.email.text, controller.password.text),
//                 decoration: InputDecoration(
//                     hintText: 'Ketikan password Anda',
//                     // suffixIcon:IconButton(onPressed: (){

//                     // }, icon: Icons.visibility_off) ,
//                     hintStyle:
//                         TextStyle(fontSize: 18, color: Colors.grey.shade400),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8))),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () => Get.toNamed(Routes.LUPAPASS),
//                 child: Text(
//                   'Lupa Password?',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.blue.shade500),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Get.toNamed(Routes.REGISTER),
//                 child: Text(
//                   'Belum Punya Akun?',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.blue.shade500),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () =>
//                     auth.login(controller.email.text, controller.password.text),
//                 child: Text('Sign in'),
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 50),
//                     backgroundColor: Colors.blue),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () => auth.signInWithGoogle(),
//                 child: Text('Sign In With Google'),
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 50),
//                     backgroundColor: Colors.blue),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () => Get.toNamed(Routes.TELEPON),
//                 child: Text('Sign In With Number'),
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 50),
//                     backgroundColor: Colors.blue),
//               ),
//               // ElevatedButton(

//               //   onPressed: () =>
//               //       auth.logout(),
//               //   child: Text('Log Out'),
//               //   style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50),padding: EdgeInsets.symmetric(vertical: 16),backgroundColor: Colors.red),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
// }

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  bool _isObscure = true;
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              // TextFormField untuk email
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // TextFormField untuk password
              TextFormField(
                controller: controller.password,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              AnimatedButton(
                onPress: () =>
                    auth.login(controller.email.text, controller.password.text),
                height: 60,
                width: double.infinity,
                text: 'Login',
                isReverse: true,
                selectedTextColor: Colors.indigo,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: Colors.indigo,
                borderColor: Colors.indigo,
                borderRadius: 12,
                borderWidth: 2,
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                height: 60,
              
                child: TextButton(
                  
                  onPressed: () => Get.toNamed(Routes.TELEPON),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login with Email',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(width: 10,),
                      Image.asset('public/Viber.png',)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                height: 60,
                child: TextButton(
                  onPressed: () => auth.signInWithGoogle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Image.asset('public/google.png',height: 34,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
