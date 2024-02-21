import 'dart:convert';

import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/data/model/agent_model/profile_agent_model.dart';
import 'package:acl_flutter/data/model/candidate/candidate_data_model.dart';
import 'package:acl_flutter/data/model/master_data_model/master_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/model/login_model/login_model.dart';

SecureStorage secStore = SecureStorage();

class SecureStorage {
  static const String user = "user";
  static const String dataAgent = "dataAgent";
  static const String token = "token";
  static const String candidateDataFaa = "candidate_data_faa";
  static const String masterData = "master_data";

  final _storage = const FlutterSecureStorage();

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
    await _storage.write(key: token, value: value);
  }


  Future<String?> getToken() async {
    final data = await _storage.read(key: token);
    if (data == null) return null;
    return data;
  }
  Future<void> setDataAgent(ProfileAgentModel data) async {
    String json = jsonEncode(data.toJson());
    await _storage.write(key: dataAgent, value: json);
  }
  Future<ProfileAgentModel> getDataAgent() async {
    String? json = await _storage.read(key: dataAgent);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      ProfileAgentModel profileAgentModel = ProfileAgentModel.fromJson(map);
      return profileAgentModel;
    } else {
      return ProfileAgentModel();
    }
  }
  Future<void> setUser(LoginModel data) async {
    String json = jsonEncode(data.toJson());
    await _storage.write(key: user, value: json);
  }

  Future<LoginModel> getUser() async {
    String? json = await _storage.read(key: user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      LoginModel loginModel = LoginModel.fromJson(map);
      return loginModel;
    } else {
      return LoginModel();
    }
  }

  Future<void> setCandidateDataFaa(CandidateDataModel data) async {
    String json = jsonEncode(data.toJson());
    await _storage.write(key: candidateDataFaa, value: json);
  }

  Future<CandidateDataModel> getCandidateDataFaa() async {
    String? json = await _storage.read(key: user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      CandidateDataModel candidateDataModel = CandidateDataModel.fromJson(map);
      return candidateDataModel;
    } else {
      return CandidateDataModel();
    }
  }

  Future<void> setMasterData(MasterDataModel data) async {
    String json = jsonEncode(data.toJson());
    await _storage.write(key: masterData, value: json);
  }

  Future<MasterDataModel> getMasterData() async {
    String? json = await _storage.read(key: masterData);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      MasterDataModel masterDataModel = MasterDataModel.fromJson(map);
      return masterDataModel;
    } else {
      return MasterDataModel();
    }
  }

  Future<void> secureDeleteLogout() async {
    await _storage.delete(key: user);
    await _storage.delete(key: token);
    await _storage.delete(key: candidateDataFaa);
    await _storage.delete(key: dataAgent);
  }
}
