import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';



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
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(AppSharedPreference.token);
    if (userString == null) return null;
    return userString;
  }
}
