import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropstam_task/controller/login_controller.dart';
import 'package:ropstam_task/view/screens/home_screen.dart';
import 'package:ropstam_task/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController controller = Get.put(LoginController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      if(controller.isLoggedIn){
        Get.off(()=>const HomeScreen());
      }else{
        Get.off(()=>const LoginScreen());
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash'),),
    );
  }
}
