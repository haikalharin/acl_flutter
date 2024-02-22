import 'package:acl_flutter/core/local_storage/secure_storage/secure_storage.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:acl_flutter/screens/sidebar_page/bloc/side_bar_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/router/routes.dart';
import '../../common/widget/popup_menu.dart';
import '../../data/model/user/user.dart';
import '../../di.dart';
import '../../myApp.dart';
import '../../utils/acl_color.dart';
import '../home_page/screen/home_page.dart';

enum Language { english, spanish, indonesia }

Language? language = Language.indonesia;

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  void initState() {
    getIt<SideBarPageBloc>().add(GetUserInfoEvent());
    super.initState();
  }

  Future<void> getUser() async {
    LoginModel user = await SecureStorage().getUser();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const ListTile(
      title: Text(
        'Menu',
        style: optionStyle,
      ),
    ),
    const ListTile(
      title: Text(
        'Menu',
        style: optionStyle,
      ),
    ),
    const ListTile(
      title: Text(
        'Menu',
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
    return BlocListener<SideBarPageBloc, SideBarPageState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: BlocBuilder<SideBarPageBloc, SideBarPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: _widgetOptions[selectedIndex],
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.addAgentPage);
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Icon(Icons.add)),
                ),
                PopupMenu<UserStatus>(
                  icon: Icons.filter_list_outlined,
                  items: UserStatus.values,
                  onChanged: (value) {},
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                // Remove padding
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(state.profileAgentModel?.pAgentName ?? ''),
                    accountEmail: Text(state.userModel?.employeeNumber ?? ''),
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
                    decoration: const BoxDecoration(
                      color: AclColors.primaryBlue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Halaman Utama'),
                    selected: selectedIndex == 0,
                    onTap: () => [_onItemTapped(0), Navigator.pop(context)],
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      AppLocalizations.of(context)!.language,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const Text('English'),
                        leading: Radio<Language>(
                          value: Language.english,
                          groupValue: language,
                          onChanged: (Language? value) {
                            setState(() {
                              language = value;
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
                          groupValue: language,
                          onChanged: (Language? value) {
                            setState(() {
                              language = value;
                            });
                            getIt<LanguageCubit>().changeLang(context, 'id');
                          },
                        ),
                      ),
                    ],
                  ), // ListTile(
                  //   leading: Icon(Icons.person),
                  //   title: Text('Friends'),
                  //   selected: selectedIndex == 1,
                  //   onTap: () =>  [_onItemTapped(1), Navigator.pop(context)],
                  // ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share'),
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
                  const Divider(),
                  ListTile(
                    title: const Text('Exit'),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () {
                      SecureStorage().secureDeleteLogout();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.initialPage,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            body: _buildWidgetBody(),
          );
        },
      ),
    );
  }

  Widget _buildWidgetBody() {
    switch (selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const HomePage();
      case 2:
        return const HomePage();
      default:
        return Container();
    }
  }
}
