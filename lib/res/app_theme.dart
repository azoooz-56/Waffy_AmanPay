import 'package:flutter/material.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
      primaryColor: AppColors.blueColor,
      scaffoldBackgroundColor: AppColors.whiteColor,

      appBarTheme: AppBarTheme(
          surfaceTintColor: AppColors.blackColor,
          scrolledUnderElevation: 0,
          toolbarTextStyle: AppStyle.instance.bodyMedium,
          iconTheme: const IconThemeData(color: AppColors.blackColor),
          backgroundColor: Colors.transparent,
          elevation: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: AppColors.blueColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: const Size(double.infinity, 55),
            textStyle: AppStyle.instance.buttonStyle),
      ),
      checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), fillColor: MaterialStateProperty.all(AppColors.redColor)),
      //inputDecoration Theme
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.whiteColor.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: AppColors.blueColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          hoverColor: AppColors.blueColor,
          contentPadding: const EdgeInsets.all(15),
          prefixIconColor: AppColors.blueColor.withOpacity(0.4),
          suffixIconColor: AppColors.blueColor.withOpacity(0.4),
          hintStyle: AppStyle.instance.bodyMedium.copyWith(color: AppColors.darkGreyColor.withOpacity(0.4))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: AppColors.greyColor,
        backgroundColor: Colors.white,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
