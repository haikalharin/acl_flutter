import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/secure.dart';



class AppSharedPreference {
  static const String user = "user";
  static const String _userFirebase = "user";
  static const String _usernameRegister = "_usernameRegister";
  static const String userRegister = "_userRegister";
  static const String loginResponse = "_loginResponse";
  static const String role = "role";
  static const String baby = "baby";
  static const String babyProgress = "babyProfress";
  static const String _person = "person";
  static const String otp = "otp";
  static const String bmSignature = "bm_signature";
  static const String checkIn = "checkin";
  static const String hospital = "hospital";
  static const String dateTimeDoandDonts = "dateTimeDoandDonts";
  static const String selectedChildId = "selected_child_id";
  static const String dateTimeVisit = "dateTimeVisit";
  static const String haveBpjsorKis = "haveBpjsorKis";
  static const String token = "token";
  static const String oldToken = "oldToken";
  static const String lastTimeGetToken = "lastTimeGetToken";
  static const String newInstall = "new_install";
  static const String isFirstLaunch = "isFirstLaunch";
  static const String isShowGuide = "show_guide";
  static const String cookie = "cookie";
  static const String playlist = "playlist";
  static const  storage = FlutterSecureStorage();


  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }


  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }


  static Future<String?> getToken() async {
    final userString = await storage.read(key: AppSharedPreference.token);
    if (userString == null) return null;
    return userString;
  }

  static setUser(LoginModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(data.toJson());
    prefs.setString(user, json);
  }

  static Future<LoginModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      LoginModel loginModel = LoginModel.fromJson(map);
      return loginModel;
    } else {
      return LoginModel();
    }
  }
}
