import 'package:bhagwat_geeta_json_app/views/screens/HomePage.dart';
import 'package:bhagwat_geeta_json_app/views/screens/SplashScreen.dart';
import 'package:bhagwat_geeta_json_app/views/screens/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    initialRoute: 'splash_screen_page',
    routes: {
      '/': (context) => HomePage(),
      'splash_screen_page': (context) => SplashScreenPage(),
      'detail_page': (context) => DetailPage(),
    },
  ));
}
