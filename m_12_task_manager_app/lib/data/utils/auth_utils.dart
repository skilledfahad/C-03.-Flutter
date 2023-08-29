import 'dart:convert';
import 'package:m_12_task_manager_app/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils{

  AuthUtils._();

  static LoginModel userInfo= LoginModel();

  static Future <void> savedUserInfo(LoginModel model) async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    await sharedPrefs.setString('user_data',jsonEncode(model.toJson()));
    userInfo = model;
  }

  static Future <void> updateUserInfo(UserData data) async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    await sharedPrefs.setString('user_data',jsonEncode(userInfo.toJson()));
    userInfo.data = data;
  }

  static Future <void> removeUserInfo() async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }

  // static Future<LoginModel> getUserInfo() async {
  //   SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
  //   String value = sharedPrefs.getString('User_data')!; // Check the null
  //   return LoginModel.fromJson(jsonDecode(value));
  // }
  //** Try 1 Problem :: Null Handel

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? value = sharedPrefs.getString('user_data');
    if (value != null) {
      return LoginModel.fromJson(await jsonDecode(value));
    } else {
      // Return a empty LoginModel object if the value is null
      return LoginModel();
    }
  }

  static Future <bool> isUserLoggedIn() async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPrefs.containsKey('user_data');
    if (isLoggedIn == false){
      userInfo = await getUserInfo();
    }
    return isLoggedIn;
  }
}