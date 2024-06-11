import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_absen_controller.dart';

class EditAbsenView extends GetView<EditAbsenController> {
  const EditAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAbsenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditAbsenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
