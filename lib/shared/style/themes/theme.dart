
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lighttheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(backgroundColor: Colors.black),
      iconTheme: IconThemeData(color: Colors.black)),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple,
      elevation: 0),
  scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple
    )
);

ThemeData darktheme = ThemeData(

  appBarTheme: AppBarTheme(
      backgroundColor: HexColor('403E3E'),
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('403E3E'),
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(
        backgroundColor: HexColor('403E3E'),
      ),
      iconTheme: IconThemeData(color: Colors.white)),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('403E3E'),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.deepPurple,

      elevation: 0),
  scaffoldBackgroundColor: HexColor('403E3E'),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor:Colors.deepPurple
  )
);