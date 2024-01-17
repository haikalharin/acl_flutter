import 'package:acl_flutter/screens/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

import '../../../core/widget/spinkit_indicator.dart';
import '../../../di.dart';
import '../../../utils/acl_color.dart';

class ListNotifyPage extends StatefulWidget {
  const ListNotifyPage({super.key});

  @override
  State<ListNotifyPage> createState() => _ListNotifyPageState();
}

class _ListNotifyPageState extends State<ListNotifyPage> {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  void initState() {
    getIt<HomePageBloc>().add(FetchListNotifyEvent());
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
          return state.submitStatus.isInProgress || state.submitStatus.isInitial
              ? const SpinKitIndicator(type: SpinKitType.circle)
              : state.submitStatus.isSuccess
                  ? state.listAgentModel!.isEmpty &&
                          !state.submitStatus.isInProgress
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                                  AppLocalizations.of(context)!.dataNotFound)))
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Center(
                                  child: ListView.builder(
                                itemCount: state.listNotify?.length,
                                itemBuilder: (context, index) {
                                  // String outputDate = "";
                                  // var outputFormat = DateFormat.yMMMMd('id');
                                  // outputDate = outputFormat.format(DateTime.parse(
                                  //     state.listAgentModel?[index].createDate ?? "0000-00-00"));
                                  return Column(
                                    children: [
                                      index == 0 ? Container() : const Divider(),
                                      ListTile(
                                        leading: const Icon(Icons.mail_rounded),
                                        title: Text(
                                          "${state.listNotify?[index].alert}",
                                          style: const TextStyle(
                                              color: AclColors.blueDark),
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
                                        child: InkWell(
                                          onTap: (){
                                            getIt<HomePageBloc>().add(FetchListNotifyEvent());
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .reload,
                                              style: const TextStyle(
                                                  color: AclColors.blueDark)),
                                        ),
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
                                            style: const TextStyle(
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
                            margin: const EdgeInsets.only(),
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
