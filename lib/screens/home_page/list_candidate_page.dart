import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../core/widget/spinkit_indicator.dart';
import '../../di.dart';
import '../../utils/acl_color.dart';

class ListCandidatePage extends StatefulWidget {
  final bool isMyCandidate;

  ListCandidatePage({super.key, required this.isMyCandidate});

  @override
  State<ListCandidatePage> createState() => _ListCandidatePageState();
}

class _ListCandidatePageState extends State<ListCandidatePage> {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  void initState() {
    getIt<HomePageBloc>().add(FetchListMyAgentEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return state.status.isLoading
              ? const SpinKitIndicator(type: SpinKitType.circle)
              : state.status.isSuccess
                  ? state.listAgentModel!.isEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: Text("Artikel tidak tersedia")))
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Center(
                                  child: ListView.builder(
                                itemCount: state.listAgentModel?.length,
                                itemBuilder: (context, index) {
                                  // String outputDate = "";
                                  // var outputFormat = DateFormat.yMMMMd('id');
                                  // outputDate = outputFormat.format(DateTime.parse(
                                  //     state.listAgentModel?[index].createDate ?? "0000-00-00"));
                                  return Column(
                                    children: [
                                      index == 0 ? Container() : Divider(),
                                      ListTile(
                                        leading: const CircleAvatar(
                                          // You can replace this with your user image
                                          backgroundImage: AssetImage(
                                              'assets/images/user.png'),
                                        ),
                                        title: Text(
                                            "${state.listAgentModel?[index].firstName} ${state.listAgentModel?[index].lastName??''}"),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(state.listAgentModel?[index]
                                                    .userId ??
                                                ''),
                                            Text(state.listAgentModel?[index]
                                                    .createDate ??
                                                ''),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
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
                                            color: AclColors
                                                .blueDark, // Color of the border
                                            width: 1.0, // Width of the border
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .reload,
                                            style: TextStyle(
                                                color: AclColors.blueDark)),
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
                                            color: AclColors
                                                .blueDark, // Color of the border
                                            width: 1.0, // Width of the border
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                            AppLocalizations.of(context)!.note,
                                            style: TextStyle(
                                                color: AclColors.blueDark)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                  : Stack(children: [
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(),
                            child: Container(
                              child: Text(state.errorMessage ?? ''),
                            )),
                      )
                    ]);
        },
      ),
    );
  }
}
