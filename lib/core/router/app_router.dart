import 'package:acl_flutter/core/router/routes.dart';
import 'package:acl_flutter/screens/home_page/home_page.dart';
import 'package:acl_flutter/screens/login_page/screen/login_screen.dart';
import 'package:acl_flutter/screens/sidebar_page/sidebar_page.dart';
import 'package:acl_flutter/screens/splashscreen_page/splashscreen_page.dart';
import 'package:acl_flutter/screens/user/user_list_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/initial_page/initial_page.dart';
import '../../screens/navbar_page/bottom_nav.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashscreenPage());
      case Routes.userList:
        return MaterialPageRoute(builder: (_) => UserListScreen());
      case Routes.loginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.navbarPage:
        return MaterialPageRoute(builder: (_) => NavbarPage());
      case Routes.initialPage:
        return MaterialPageRoute(builder: (_) => InitialPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.sidebarPage:
        return MaterialPageRoute(builder: (_) => SideBarPage());
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
