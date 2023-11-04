import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../sidebar_page/sidebar_page.dart';

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
            color: Colors.green,
          ),
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(
                  child: Text(AppLocalizations.of(context)!.myRecruitment,
                      style: TextStyle(color: Colors.blue))),
              Tab(
                  child: Text(AppLocalizations.of(context)!.beRecruitment,
                      style: TextStyle(color: Colors.blue))),
              Tab(
                  child: Text(AppLocalizations.of(context)!.notification,
                      style: TextStyle(color: Colors.blue))),
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
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Tab 1 Content ' +
                              AppLocalizations.of(context)!.helloWorld,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue, // Color of the border
                              width: 1.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(AppLocalizations.of(context)!.sorted,
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                // Center(
                //   child: Text('Tab 1 Content '+AppLocalizations.of(context)!.helloWorld,style: TextStyle(color: Colors.blue),),
                // ),
                // Content for Tab 2
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Tab 2 Content ' +
                              AppLocalizations.of(context)!.helloWorld,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue, // Color of the border
                              width: 1.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(AppLocalizations.of(context)!.sorted,
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                // Content for Tab 3
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Tab 3 Content ' +
                              AppLocalizations.of(context)!.helloWorld,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 50,
                              // width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.blue, // Color of the border
                                    width: 1.0, // Width of the border
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(AppLocalizations.of(context)!.reload,
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 50,
                              // width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.blue, // Color of the border
                                    width: 1.0, // Width of the border
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(AppLocalizations.of(context)!.note,
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // Center(child: Container(child: Text(AppLocalizations.of(context)!.helloWorld),)),
    );
  }
}
