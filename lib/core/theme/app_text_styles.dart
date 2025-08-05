import 'package:credconnect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static  final String? _fontKoulen = GoogleFonts.koulen().fontFamily; 
  static  final String? _fontKarla = GoogleFonts.karla().fontFamily; 

  static  TextStyle headline1 = TextStyle(
    fontFamily: _fontKoulen,
    fontWeight: FontWeight.w400,
    fontSize: 36,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static  TextStyle headline2 = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w700,
    fontSize: 30,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );

  static  TextStyle headline3 = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w700,
    fontSize: 35,
    letterSpacing: 0.0,
    color: AppColors.textPrimary,
  );

  

  static  TextStyle subtitle1 = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );

   static  TextStyle subtitle2 = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w300,
    fontSize: 16,
    letterSpacing: 0,
    color: AppColors.textTertiary,
  );



   static  TextStyle button = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    letterSpacing: 0,
    color: AppColors.textTertiary,    
  ); 

      static  TextStyle button2 = TextStyle(
    fontFamily: _fontKarla,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0,
    color: AppColors.textSecondary,    
  ); 

}