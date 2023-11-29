import 'package:acl_flutter/core/router/routes.dart';
import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../core/widget/drop_down.dart';
import '../../core/widget/spinkit_indicator.dart';
import '../../di.dart';
import '../../utils/acl_color.dart';

enum EnvName { dev, staging, prod }

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
    if (widget.isMyCandidate) {
      getIt<HomePageBloc>().add(FetchListMyAgentEvent());
    } else {
      getIt<HomePageBloc>().add(FetchListBeAgentEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return state.submitStatus.isInProgress
              ? const SpinKitIndicator(type: SpinKitType.circle)
              : state.submitStatus.isSuccess
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
                                itemCount: widget.isMyCandidate
                                    ? state.listAgentModel?.length
                                    : state.listAgentBeModel?.length,
                                itemBuilder: (context, index) {
                                  String startDate = "";
                                  if (!widget.isMyCandidate) {
                                    var outputFormat = DateFormat.yMMMMd('en');
                                    startDate = outputFormat.format(
                                        DateTime.parse(state
                                                .listAgentBeModel?[index]
                                                .startDate ??
                                            "0000-00-00"));
                                  } else {
                                    var outputFormat = DateFormat.yMMMMd('en');
                                    var data =
                                        state.listAgentModel?[index].createDate;
                                    var dataFix = data?.replaceAll('/', '-');
                                    startDate = outputFormat.format(
                                        DateTime.parse(
                                            dataFix ?? "0000-00-00"));
                                  }
                                  return Column(
                                    children: [
                                      index == 0 ? Container() : Divider(),
                                      ListTile(
                                        leading: const CircleAvatar(
                                          // You can replace this with your user image
                                          backgroundImage: AssetImage(
                                              'assets/images/user.png'),
                                        ),
                                        title: Text(widget.isMyCandidate
                                            ? "${state.listAgentModel?[index].firstName} ${state.listAgentModel?[index].lastName ?? ''}"
                                            : "${state.listAgentBeModel?[index].firstName} ${state.listAgentBeModel?[index].lastName ?? ''}"),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            widget.isMyCandidate
                                                ? Text(state
                                                        .listAgentModel?[index]
                                                        .userId ??
                                                    '')
                                                : Text(state
                                                        .listAgentBeModel?[
                                                            index]
                                                        .userId ??
                                                    ''),
                                            Text('SC: $startDate'),
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
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      builder: (_) {
                                        return Wrap(
                                          children: [
                                            ListTile(
                                                leading: Icon(
                                                    Icons.filter_list_sharp),
                                                title: const Text('Name[Asc]'),
                                                onTap: () async {
                                                  if (widget.isMyCandidate) {
                                                    getIt<HomePageBloc>().add(
                                                        FetchListMyAgentEvent(
                                                            filter: 1));
                                                    Navigator.pop(context);
                                                  } else{
                                                    getIt<HomePageBloc>().add(
                                                        FetchListBeAgentEvent(
                                                            filter: 1));
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                            ListTile(
                                                leading: Icon(
                                                    Icons.filter_list_sharp),
                                                title: const Text('Name[Dsc]'),
                                                onTap: () async {
                                                  if (widget.isMyCandidate) {
                                                    getIt<HomePageBloc>().add(
                                                        FetchListMyAgentEvent(
                                                            filter: 2));
                                                    Navigator.pop(context);
                                                  }else{
                                                    getIt<HomePageBloc>().add(
                                                        FetchListBeAgentEvent(
                                                            filter: 2));
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                            ListTile(
                                                leading: Icon(
                                                    Icons.filter_list_sharp),
                                                title: const Text(
                                                    'Simple Checking Submission'),
                                                onTap: () async {
                                                  if (widget.isMyCandidate) {
                                                    getIt<HomePageBloc>().add(
                                                        FetchListMyAgentEvent(
                                                            filter: 3));
                                                    Navigator.pop(context);
                                                  }else{
                                                    getIt<HomePageBloc>().add(
                                                        FetchListBeAgentEvent(
                                                            filter: 3));
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                            ListTile(
                                                leading: Icon(
                                                    Icons.filter_list_sharp),
                                                title: const Text(
                                                    'FAA Submission'),
                                                onTap: () async {
                                                  if (widget.isMyCandidate) {
                                                    getIt<HomePageBloc>().add(
                                                        FetchListMyAgentEvent(
                                                            filter: 4));
                                                    Navigator.pop(context);
                                                  }else{
                                                    getIt<HomePageBloc>().add(
                                                        FetchListBeAgentEvent(
                                                            filter: 4));
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                            ListTile(
                                                leading: Icon(
                                                    Icons.filter_list_sharp),
                                                title: const Text('Default'),
                                                onTap: () async {
                                                  if (widget.isMyCandidate) {
                                                    getIt<HomePageBloc>().add(
                                                        FetchListMyAgentEvent());
                                                    Navigator.pop(context);
                                                  }else{
                                                    getIt<HomePageBloc>().add(
                                                        FetchListBeAgentEvent());
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                          ],
                                        );
                                      });
                                },
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
                                        AppLocalizations.of(context)!.sorted,
                                        style: TextStyle(
                                            color: AclColors.blueDark)),
                                  ),
                                ),
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
