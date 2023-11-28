import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'firebase_service.dart';

dynamic getDataValue(dynamic result) => result;

dynamic getGameUrl(dynamic result) => result['game_url'];

dynamic getPersonUid(dynamic result) => result['uid'];

dynamic getData(dynamic result) => result['data'];

int getCode(dynamic result) => result['code'];



String getFormattedUrl(String? url, Map<String, String>? variables) {
  return url!.replaceAllMapped(RegExp(r'{{\w+}}'), (match) {
    final key = match.group(0)!.replaceAll(RegExp(r'[{}]'), '');
    return variables![key]!;
  });
}

String remoteConfigGetString(String key) {
  return FirebaseService().remoteConfig.getString(key);
}

int remoteConfigGetInt(FirebaseRemoteConfig remoteConfig, String key) {
    return FirebaseService().remoteConfig.getInt(key);
}
