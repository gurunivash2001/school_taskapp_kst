import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooltask/app/Utils/global_sharedpreference.dart';
 import 'package:schooltask/app/modules/login/login_screen.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     
      home:LoginScreen()
    );
  }
}
