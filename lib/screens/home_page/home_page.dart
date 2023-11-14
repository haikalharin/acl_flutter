import 'package:acl_flutter/screens/home_page/list_notify_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/router/app_router.dart';
import '../../core/router/routes.dart';
import '../../utils/acl_color.dart';
import '../sidebar_page/sidebar_page.dart';
import 'list_candidate_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: AclColors.blueDark,
          ),
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(
                  child: Text(AppLocalizations.of(context)!.myRecruitment,
                      style: TextStyle(color: AclColors.blueDark))),
              Tab(
                  child: Text(AppLocalizations.of(context)!.beRecruitment,
                      style: TextStyle(color: AclColors.blueDark))),
              Tab(
                  child: Text(AppLocalizations.of(context)!.notification,
                      style: TextStyle(color: AclColors.blueDark))),
            ],
          ),
          Divider(
            // Add a Divider under the TabBar
            height: 1,
            color: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for Tab 1
                ListCandidatePage(isMyCandidate: true,),
                // Center(
                //   child: Text('Tab 1 Content '+AppLocalizations.of(context)!.helloWorld,style: TextStyle(color: AclColors.blueDark),),
                // ),
                // Content for Tab 2
                ListCandidatePage(isMyCandidate: false,),
                // Content for Tab 3
               ListNotifyPage()
              ],
            ),
          ),
        ],
      ),
      // Center(child: Container(child: Text(AppLocalizations.of(context)!.helloWorld),)),
    );
  }
}
