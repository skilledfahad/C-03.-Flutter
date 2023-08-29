import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:m_12_task_manager_app/app.dart';
import 'package:m_12_task_manager_app/data/utils/auth_utils.dart';
import 'package:m_12_task_manager_app/ui/utils/snack_bar_msg.dart';
import '../../ui/screens/authentication_screens/login_screen.dart';
import '../models/network_response_object.dart';

class ApiCaller {

  Future<NetworkResponse> getRequest(String url) async {

    try{
      Response response= await get(
        Uri.parse(url),
        headers:{
          "toKen" : AuthUtils.userInfo.token.toString()
        },
      );
      if ( response.statusCode == 200){
        return NetworkResponse(true,response.statusCode,jsonDecode(response.body));
      }else if(response.statusCode == 401)
      {
        SnackBarMsg(TaskManagerApp.globalKey.currentState!.context,"Login Expired! Please Login Again");
        gotoLogIN();
      }
      else{
        return NetworkResponse(false,response.statusCode,jsonDecode(response.body));
      }
    }
    catch (e){
      log(e.toString());
    }
    return NetworkResponse(false,-1,null);
  }



  Future<NetworkResponse> postRequest(String url,Map<String,dynamic> body,{bool isLogin=false}) async {

    try{
      Response response= await post(
          Uri.parse(url),
          headers:{
            "Content-Type":"application/json",
            "toKen" : AuthUtils.userInfo.token.toString()
          },
          body: jsonEncode(body));

      if ( response.statusCode == 200){
        return NetworkResponse(true,response.statusCode,jsonDecode(response.body));
      }else if(response.statusCode == 401)
      {
        SnackBarMsg(TaskManagerApp.globalKey.currentState!.context,"Login Expired! Please Login Again");
        if (isLogin == false) {
          gotoLogIN();
        }
      }else{
        return NetworkResponse(false,response.statusCode,jsonDecode(response.body));
      }
    }
    catch (e){
      log(e.toString());
    }
    return NetworkResponse(false,-1,null);
  }

  gotoLogIN() {
    AuthUtils.removeUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}