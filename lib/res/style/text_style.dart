import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waffy_clone/res/color.dart';

class AppStyle {
  static AppStyle instance = AppStyle._init();

  AppStyle._init();

  final TextStyle h2Bold = GoogleFonts.urbanist(
    color: AppColors.blackColor,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h4Bold = GoogleFonts.urbanist(
    color: AppColors.blackColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h5Bold = GoogleFonts.urbanist(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h6Bold = GoogleFonts.urbanist(
    color: AppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,

  );

  final TextStyle bodyXLarge = GoogleFonts.urbanist(
    color: AppColors.darkGreyColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle bodyMedium = GoogleFonts.urbanist(
    color: AppColors.darkGreyColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  final TextStyle smallWhiteText = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  final TextStyle errorMsg = GoogleFonts.urbanist(
    color: AppColors.redColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  final TextStyle textBold = GoogleFonts.urbanist(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  final TextStyle grayTextBold = GoogleFonts.urbanist(
    color: AppColors.darkGreyColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  final TextStyle buttonStyle = GoogleFonts.urbanist(
    color: AppColors.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}