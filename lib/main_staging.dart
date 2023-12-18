import 'dart:async';

import 'env.dart' as config;
import 'package:acl_flutter/flavors.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common/configurations/configurations.dart';
import 'di.dart';
import 'myApp.dart';
enum SubmitStatus { empty, loading, failure, success }
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
void main() async {
  runZonedGuarded<Future<void>>(() async {


    if (kDebugMode) {
      print(F.appFlavor);
    }

  }, (error, stack) async {
    // await Sentry.captureException(error, stackTrace: stack);
    // await FirebaseCrashlytics.instance.recordError(error, stack);
  });

  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await Configurations().setConfigurationValues(config.stagingEnvironment);
  runApp( MyApp());
}

