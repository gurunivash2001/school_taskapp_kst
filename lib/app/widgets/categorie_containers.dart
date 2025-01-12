import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooltask/app/core/app_style.dart';

class CategorieContainers extends StatelessWidget {
  final IconData icon; 
  final String title;

  const CategorieContainers({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height / 13,
          width: Get.width / 5.3,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Icon(
            icon,  
            size: Get.width / 9,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
