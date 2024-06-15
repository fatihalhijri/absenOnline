// // ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, void_checks

// import 'package:absenonline/app/controllers/auth_controller.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/register_controller.dart';

// class RegisterView extends GetView<RegisterController> {
//   RegisterView({Key? key}) : super(key: key);
//   final auth = Get.put(AuthController());
//   bool _isObscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(
//                 'Register',
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Email',
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                 TextField(
//                   controller: controller.email,
//                   decoration: InputDecoration(
//                       hintText: 'Ketikan Email Anda',
//                       hintStyle:
//                           TextStyle(fontSize: 18, color: Colors.grey.shade400),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(width: 1, color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.yellow))),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//                 Text(
//                   'Password',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 TextField(
//                   controller: controller.password,
//                   obscureText: _isObscure,
//                   onSubmitted: (value) => auth.register(
//                       controller.email.text,
//                       controller.password.text,
//                       controller.konfirmasiPassword.text,
//                       roleler.konfirmasiPassword.text,
// ),
//                   decoration: InputDecoration(
//                       hintText: 'Ketikan password Anda',
//                       // suffixIcon:IconButton(onPressed: (){

//                       // }, icon: Icons.visibility_off) ,
//                       hintStyle:
//                           TextStyle(fontSize: 18, color: Colors.grey.shade400),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(width: 1, color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8))),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//                 Text(
//                   'konfirmasi Password',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 TextField(
//                   controller: controller.konfirmasiPassword,
//                   obscureText: _isObscure,
//                   onSubmitted: (value) => auth.register(
//                       controller.email.text,
//                       controller.password.text,
//                       controller.konfirmasiPassword.text,
//                       roleler.konfirmasiPassword.text,
// ),
//                   decoration: InputDecoration(
//                       hintText: 'Ketikan password Anda',
//                       // suffixIcon:IconButton(onPressed: (){

//                       // }, icon: Icons.visibility_off) ,
//                       hintStyle:
//                           TextStyle(fontSize: 18, color: Colors.grey.shade400),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(width: 1, color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8))),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Get.defaultDialog();

//                     return auth.register(
//                         controller.email.text,
//                         controller.password.text,
//                         controller.konfirmasiPassword.text,
//                         roleoller.konfirmasiPassword.text,
// );
//                   },
//                   child: Text('Register'),
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       backgroundColor: Colors.blue),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 // ElevatedButton(

//                 //   onPressed: () =>
//                 //       auth.logout(),
//                 //   child: Text('Log Out'),
//                 //   style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50),padding: EdgeInsets.symmetric(vertical: 16),backgroundColor: Colors.red),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, void_checks

import 'package:absenonline/app/controllers/auth_controller.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final auth = Get.put(AuthController());
  bool _isObscure = true;
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
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: controller.name,
                decoration: InputDecoration(
                  hintText: 'Nama',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16),
              TextField(
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
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller.password,
                obscureText: _isObscure,
                onSubmitted: (value) => auth.register(
                      controller.name.text,
                      controller.email.text,
                      controller.password.text,
                      controller.konfirmasiPassword.text,
                      controller.role.text,
                      ),
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
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller.konfirmasiPassword,
                obscureText: _isObscure,
                onSubmitted: (value) => auth.register(
                      controller.name.text,
                      controller.email.text,
                      controller.password.text,
                      controller.konfirmasiPassword.text,
                      controller.role.text,
                      ),
                decoration: InputDecoration(
                  hintText: 'Konfimasi Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller.role,
                obscureText: _isObscure,
                onSubmitted: (value) => auth.register(
                      controller.name.text,
                      controller.email.text,
                      controller.password.text,
                      controller.konfirmasiPassword.text,
                      controller.role.text,
                      ),
                decoration: InputDecoration(
                  hintText: 'Role anda',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 24),
              AnimatedButton(
                onPress: () {
                  // Get.defaultDialog();

                  return auth.register(
                      controller.name.text,
                      controller.email.text,
                      controller.password.text,
                      controller.konfirmasiPassword.text,
                      controller.role.text,
                      );
                },
                height: 60,
                width: double.infinity,
                text: 'Sign Up',
                isReverse: true,
                selectedTextColor: Colors.indigo,
                transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                backgroundColor: Colors.indigo,
                borderColor: Colors.indigo,
                borderRadius: 12,
                borderWidth: 2,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: (){
                      Get.offNamed(Routes.LOGIN);
                    },
                    child: Text(
                      'Login',
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
