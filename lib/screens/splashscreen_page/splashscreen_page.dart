
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:in_app_update/in_app_update.dart';



import '../../core/local_storage/shared_preference/app_shared_preference.dart';
import '../../core/router/routes.dart';
import '../../di.dart';
import '../../main_dev.dart' as dev;
import 'bloc/splash_screen_bloc.dart';
import 'package:intl/intl_standalone.dart';

// late final FirebaseRemoteConfig remoteConfig;

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  bool? skipOnboarding = false;
  // static FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  bool _isLoading = true;
  late Color _color;
  // final Alice _alice = Alice(
  //     showNotification: true,
  //     darkTheme: false);

  void getFirstInstall() async{
    bool? _skipOnboarding = await AppSharedPreference.getBool(AppSharedPreference.newInstall);
    setState(() {
      skipOnboarding = _skipOnboarding;
      // _alice.showInspector();
    });
    print('skip onboarding : $skipOnboarding');
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      print("update info : $info");
      if(info.updateAvailability == UpdateAvailability.updateAvailable){
        InAppUpdate.performImmediateUpdate();
      }
    }).catchError((e) {
      print("Error Perform Auto Update : $e");
    });
  }


  Future<void> _init() async {

  }

  @override
  void initState() {
    _init();
    getFirstInstall();
    getIt<SplashscreenBloc>().add(SplashscreenCheckUserExist());
    // _initializeRemoteConfig();
    checkForUpdate();
    super.initState();
  }

  // Future<void> _fetchRemoteConfig() async {
  //   try {
  //     await _remoteConfig.fetchAndActivate();
  //     await _remoteConfig.fetch();
  //     await _remoteConfig.activate();
  //
  //     print('Last fetch status: ' + _remoteConfig.lastFetchStatus.toString());
  //     print('Last fetch time: ' + _remoteConfig.lastFetchTime.toString());
  //     print('New color enabled?: ' + _remoteConfig.getBool('new_color_enabled').toString());
  //
  //     setState(() {
  //       remoteConfig = _remoteConfig;
  //     });
  //   } catch (e) {
  //     print('Error: ${e.toString()}');
  //   }
  //
  // }

  // _initializeRemoteConfig() async {
  //   if (_remoteConfig == null) {
  //     _remoteConfig = await RemoteConfig.instance;
  //
  //     final Map<String, dynamic> defaults = <String, dynamic>{
  //       'new_color_enabled': false
  //     };
  //     await _remoteConfig.setDefaults(defaults);
  //
  //     _remoteConfig.setConfigSettings(RemoteConfigSettings(
  //      fetchTimeout:  Duration(milliseconds: 1), minimumFetchInterval: Duration(milliseconds: 1),
  //     ));
  //
  //     await _fetchRemoteConfig();
  //   }
  //
  //
  //
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenBloc, SplashscreenState>(
      listener: (context, state) async {
      if (state.submitStatus == FormzSubmissionStatus.success) {
        if(state.isExist){
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.sidebarPage,
                (Route<dynamic> route) => false,
          );
        } else{
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.initialPage,
                (Route<dynamic> route) => false,
          );
        }
      }
      },
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/allianz_logo.png" ),
              )
          );
        },
      ),
    );
  }
}
