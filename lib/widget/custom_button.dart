import 'package:flutter/material.dart';
import 'package:online/const/app_colors.dart';
 // Assuming this is the correct import path for AppColors

Widget customButton(String title, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.greenColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: Text(title),
    ),
  );
}
