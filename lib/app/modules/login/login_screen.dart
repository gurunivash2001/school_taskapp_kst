import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:schooltask/app/core/app_asset.dart';
import 'package:schooltask/app/core/app_string.dart';
import 'package:schooltask/app/core/app_style.dart';
import 'package:schooltask/app/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(AppAsset.logo, scale: 1),
              const SizedBox(height: 20),
              Obx(
                () => controller.showFields.value
                    ? _buildLoginFields(context)
                    : Text(AppString.welcomeToTheSchoolapp,
                        style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFields(BuildContext context) {
    return Column(
      children: [
        _buildFieldTitle(AppString.userName),
        _buildTextField(
          controller: controller.userIdController,
          hintText: AppString.userId,
          icon: Icons.person_2_outlined,
          iconcolor: Colors.indigo,
        ),
        const SizedBox(height: 15),
        _buildFieldTitle(AppString.password),
        _buildTextField(
          controller: controller.passwordController,
          hintText: AppString.password,
          icon: Icons.lock_outline,
          iconcolor: Colors.indigo,
          obscureText: controller.isPasswordVisible.value,
          suffixIcon: IconButton(
            icon: Icon(controller.isPasswordVisible.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(AppString.forgetPassword, style: headLine2),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildSignUpRow(),
      ],
    );
  }

  Widget _buildFieldTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(text, style: headLine1)],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Color iconcolor,
    bool obscureText = false,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: Icon(icon),
          iconColor: iconcolor,
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return InkWell(
      onTap: controller.handleLogin,
      child: Container(
        height: Get.height / 14,
        width: Get.width / 1.7,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(AppString.logIn, style: headLine3),
        ),
      ),
    );
  }

  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppString.dontHaveAnAccount, style: headLine1),
        TextButton(
          onPressed: () {},
          child: Text(
            AppString.signUp,
            style: headLine1.copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
