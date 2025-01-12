import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooltask/app/core/app_string.dart';
import 'package:schooltask/app/modules/login/login_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: controller.signOut, child: Text(AppString.logOut)),
      ),
    );
  }
}
