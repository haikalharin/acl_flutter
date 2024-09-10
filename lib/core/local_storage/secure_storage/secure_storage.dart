import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/model/login_model/login_model.dart';
import '../shared_preference/app_shared_preference.dart';

SecureStorage secStore = SecureStorage();

class SecureStorage {
  final _storage = FlutterSecureStorage();
  void addNewItem(String key, String value) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
    );
  }

  IOSOptions _getIOSOptions() => IOSOptions(
    accountName: _getAccountName(),
  );

  String _getAccountName() => 'blah_blah_blah';

  Future<String?> secureRead(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<void> secureDeleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> secureDelete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> secureWrite(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> setToken(String value) async {
   await _storage.write(key: AppSharedPreference.token,value: value);
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: AppSharedPreference.token);
    if (token == null) return null;
    return token;
  }

  Future<void> setUser(LoginModel data) async {
    String json = jsonEncode(data.toJson());
   await _storage.write(key: AppSharedPreference.user,value:json  );
  }

   Future<LoginModel> getUser() async {
    String? json = await _storage.read( key: AppSharedPreference.user);
    Map<String, dynamic> map = jsonDecode(json??'');
    LoginModel loginModel = LoginModel.fromJson(map);
    return loginModel;
    }
}