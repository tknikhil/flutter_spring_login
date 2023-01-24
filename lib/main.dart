import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spring_login/src/presentation/pages/bottom_navigation_bar_page.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
     home: Login(),
    // home: Search(),
    //  home: BottomNavigationBarPage(),
  ));
}
