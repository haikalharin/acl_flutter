import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../di.dart';
import '../../myApp.dart';
import '../home_page/home_page.dart';
import '../user/user_list_screen.dart';
enum Language { english, spanish, indonesia }
class SideBarPage extends StatefulWidget {
  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  Language? _language = Language.indonesia;
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  static final List<Widget> _widgetOptions = <Widget>[
    const ListTile(
      title: Text(
        'Home',
        style: optionStyle,
      ),
    ),
    const ListTile(
      title: Text(
        'user list',
        style: optionStyle,
      ),
    ),
    const ListTile(
      title: Text(
        'Home',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions[selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Oflutter.com'),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: selectedIndex == 0,
              onTap: () => [_onItemTapped(0), Navigator.pop(context)],
            ),
            ListTile(
              leading: Icon(Icons.person),
              selected: selectedIndex == 1,
              title: ExpansionTile(
                title: Text(
                    AppLocalizations.of(context)!.language,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  ListTile(
                    title: const Text('English'),
                    leading: Radio<Language>(
                      value: Language.english,
                      groupValue: _language,
                      onChanged: (Language? value) {
                        setState(() {
                          _language = value;
                        });
                        getIt<LanguageCubit>().changeLang(context, 'en');
                      },
                    ),
                  ),
                  // ListTile(
                  //   title: const Text('Spain'),
                  //   leading: Radio<Language>(
                  //     value: Language.spanish,
                  //     groupValue: _language,
                  //     onChanged: (Language? value) {
                  //       setState(() {
                  //         _language = value;
                  //       });
                  //       getIt<LanguageCubit>().changeLang(context, 'es');
                  //     },
                  //   ),
                  // ),
                  ListTile(
                    title: const Text('Indonesia'),
                    leading: Radio<Language>(
                      value: Language.indonesia,
                      groupValue: _language,
                      onChanged: (Language? value) {
                        setState(() {
                          _language = value;
                        });
                        getIt<LanguageCubit>().changeLang(context, 'id');
                      },
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Friends'),
            //   selected: selectedIndex == 1,
            //   onTap: () =>  [_onItemTapped(1), Navigator.pop(context)],
            // ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              selected: selectedIndex == 2,
              onTap: () => [_onItemTapped(2), Navigator.pop(context)],
            ),
            // ListTile(
            //   leading: Icon(Icons.notifications),
            //   title: Text('Request'),
            // ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Settings'),
            //   onTap: () => null,
            // ),
            // ListTile(
            //   leading: Icon(Icons.description),
            //   title: Text('Policies'),
            //   onTap: () => null,
            // ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => null,
            ),
          ],
        ),
      ),
      body: _buildWidgetBody(),
    );
  }

  Widget _buildWidgetBody() {
    switch (selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return UserListScreen();
      case 2:
        return HomePage();
      default:
        return Container();
    }
  }
}
