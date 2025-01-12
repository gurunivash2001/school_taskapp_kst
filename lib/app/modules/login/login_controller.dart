import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schooltask/app/modules/login/login_screen.dart';
import 'package:schooltask/app/modules/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class LoginController extends GetxController {
  var isPasswordVisible = true.obs;
  var showFields = false.obs;

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
    Future.delayed(const Duration(seconds: 2), () {
      showFields.value = true;
    });
  }




Future<void> _checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  String? userName = prefs.getString('username');  

  if (token != null && userName != null) {
    Get.off(() => NavigationMenu(userName: userName));
  }
}





  Future<void> handleLogin() async {
    await _apiLogin();
  }

Future<void> _apiLogin() async {
  final Uri url = Uri.parse('https://login-auth-lyart.vercel.app/api/auth/login');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'username': userIdController.text.trim(),
        'password': passwordController.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data.containsKey('token') && data.containsKey('username')) {
        String token = data['token'];
        String userName = data['username'];

        await _saveTokenAndUsername(token, userName);  

        Get.off(() => NavigationMenu(userName: userName));
      } else {
        Get.snackbar('Login Failed', 'Unexpected response from server.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials, please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    Get.snackbar('Error', 'An error occurred while logging in: $e',
        snackPosition: SnackPosition.BOTTOM);
  }
}






Future<void> _saveTokenAndUsername(String token, String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('username', username);  
}




  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => LoginScreen());
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    userIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
