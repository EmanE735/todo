import 'package:flutter/material.dart';

class AppTheme{
  static const Color lightprimary = Color(0xFFDFECDB);
   static const Color darkprimary = Color(0xFF200E32);
    static const Color primary = Color(0xFF3598DB);
     static const Color black = Color(0xFF060E1E);
     static const Color white = Color(0xFFFFFFFF);
      static const Color green = Color(0xFF61E757);
      static const Color red = Color(0xFFEC4B4B);
      static const Color grey = Color(0xFFC8C9CB);
  static ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor: lightprimary,
    primaryColor: primary,
   bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: white,
    selectedItemColor: primary,
    unselectedItemColor: grey,
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primary,
    foregroundColor: white,
    shape: CircleBorder(
      side: BorderSide(
        width: 4,
        color: white
      )
    )
   ),
    textTheme: TextTheme(
    titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppTheme.primary
      ),
      titleSmall: TextStyle(
          fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black

      )
    )
  
  );
}