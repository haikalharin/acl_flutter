import 'package:acl_flutter/core/router/routes.dart';
import 'package:acl_flutter/screens/add_candidate_page/screen/add_canddate_page.dart';
import 'package:acl_flutter/screens/detail_candidate/screen/detail_candidate_page.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/faa_form_candidate_page.dart';
import 'package:acl_flutter/screens/home_page/screen/home_page.dart';
import 'package:acl_flutter/screens/login_page/screen/login_page.dart';
import 'package:acl_flutter/screens/sidebar_page/sidebar_page.dart';
import 'package:acl_flutter/screens/splashscreen_page/splashscreen_page.dart';
import 'package:flutter/material.dart';

import '../../screens/initial_page/initial_page.dart';
import '../../screens/navbar_page/bottom_nav.dart';
import '../../utils/remote_utils.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashscreenPage());
      case Routes.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.navbarPage:
        return MaterialPageRoute(builder: (_) => const NavbarPage());
      case Routes.initialPage:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.sidebarPage:
        return MaterialPageRoute(builder: (_) => const SideBarPage());
      case Routes.addAgentPage:
        return MaterialPageRoute(builder: (_) => const AddCandidatePage());
      case Routes.detailCandidatePage:
        return MaterialPageRoute(
            builder: (_) => DetailCandidatePage(
                  candidateModel: getCandidateModel(settings.arguments),
                  isMyCandidate: getIsMyCandidate(settings.arguments),
                ));
      case Routes.faaFormCandidatePage:
        return MaterialPageRoute(
            builder: (_) => FaaFormCandidatePage(
                  candidateModel: getCandidateModel(settings.arguments),
                ));
       default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
