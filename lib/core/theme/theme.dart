import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utls/app_colors.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.background,

    //appBarTheme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),

    //textTheme
    textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.lato(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
            ),
        displaySmall: GoogleFonts.lato(
          color: AppColors.white.withOpacity(.66),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),

    //buttonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      //enabledBorder
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //focusedBorder
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //hint
      hintStyle: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16.sp,
      ),
      // helperStyle: TextStyle(color: AppColors.white),
      //fillColor
      fillColor: AppColors.lightBlack,
      filled: true,
    ),
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,

    //appBarTheme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),

    //textTheme
    textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.background,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.background,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        displaySmall: GoogleFonts.lato(
          color: AppColors.background.withOpacity(.44),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),

    //buttonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      //enabledBorder
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //focusedBorder
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //hint
      hintStyle: GoogleFonts.lato(
        color: AppColors.background,
        fontSize: 16.sp,
      ),
      //fillColor
      fillColor: AppColors.white,
      filled: true,
    ),
  );
}
