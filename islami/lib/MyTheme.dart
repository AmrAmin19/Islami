import 'package:flutter/material.dart';

class MyTheme
{
  static Color blackColor =Color(0xff242424);
  static Color primaryLightColor =Color(0xffB7935F);
  static Color primaryDarkColor =Color(0xff141A2E);
  static Color whiteColor =Color(0xffffffff);
  static Color yellowColor =Color(0xffFACC1D);


  static ThemeData lightMode =ThemeData(
    primaryColor: primaryLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: blackColor,
      backgroundColor: primaryLightColor,

    ),

    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: TextTheme(
       titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      titleSmall:  TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),

    )
  );

  static ThemeData darkMode =ThemeData(
      primaryColor: primaryDarkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        selectedItemColor: yellowColor,
        //backgroundColor: primaryDarkColor,

      ),

      scaffoldBackgroundColor: Colors.transparent,

      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: whiteColor
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
        titleSmall:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: whiteColor,
        ),

      )
  );
}