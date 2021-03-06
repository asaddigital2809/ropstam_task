import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropstam_task/view/screens/home_screen.dart';
import 'package:ropstam_task/view/screens/login_screen.dart';
import 'package:ropstam_task/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ropstam Task',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

