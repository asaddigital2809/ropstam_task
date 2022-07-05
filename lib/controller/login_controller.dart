import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ropstam_task/utils/api_end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  bool isLoggedIn = false;
  var status;

  @override
  void onInit() {
    manageSession();
  }

  loginMethod(String email,String password) async{
    isLoading = true;
    update();
    var response = await http.post(
      Uri.parse(APIEndPoints.LOGIN_API),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "email": email,
        "password": password,
        "device_token": "zasdcvgtghnkiuhgfde345tewasdfghjkm"
      }),
    );
    var body = jsonDecode(response.body);
     status = body['meta']['status'];
    if(status == 200){
      saveSession(body['data']['access_token']);
      isLoading = false;
    }else if(status == 401){
      isLoading = false;
      Get.snackbar('Error', body['meta']['message']);
    }else{
      Get.snackbar('Error', body['meta']['message']);
      isLoading = false;
    }
    update();
  }
  saveSession(String token)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }
  manageSession()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if( preferences.containsKey('token')){
      isLoggedIn = true;
    }
    update();
  }
}