import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/dialog/progress_dialog.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../common/widget/button_widget.dart';
import '../../../../di.dart';
import '../../bloc/faa_candidate_page_bloc.dart';
import '../expansion_widget/Education/add_education_dialog.dart';

class EducationDataPage extends StatefulWidget {
  final TabController tabController;

  const EducationDataPage({super.key, required this.tabController});

  @override
  State<EducationDataPage> createState() => _EducationDataPageState();
}

class _EducationDataPageState extends State<EducationDataPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool isEmployee = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaaCandidatePageBloc, FaaCandidatePageState>(
      listener: (context, state) async {
        if(state.submitStatus.isSuccess){
          if(state.message == 'success-submit-education'){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  title: "Berhasil input pendidikan",
                  isProgressed: false,
                );
              },
            );
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
            // widget.tabController.animateTo();
          }
        }
      },
      child: BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Wrap(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 8),
                                state.addEducationModel != null &&
                                        state.addEducationModel?.level != null
                                    ? Card(
                                        margin: const EdgeInsets.all(16.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: 8),
                                                padding: EdgeInsets.all(4),
                                                decoration: const BoxDecoration(
                                                    color: AclColors.primaryBlue,
                                                    shape: BoxShape.circle),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons
                                                        .chrome_reader_mode_outlined,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(state.addEducationModel
                                                            ?.schoolName ??
                                                        ''),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                        '${state.addEducationModel?.startLearningDate?.year ?? ''}-'
                                                        '${state.addEducationModel?.endLearningDate?.year ?? ''}'),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context: context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AddEducationDialog(
                                                                    onCancelPressed:
                                                                        () => Navigator
                                                                            .pop(
                                                                                context),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: const Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.create,
                                                                  size: 14,
                                                                  color: AclColors
                                                                      .green,
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text('Ubah'),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              getIt<FaaCandidatePageBloc>().add(
                                                                  AddWorkingExperienceEvent(
                                                                      isDelete:
                                                                          true));
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration: const BoxDecoration(
                                                                      color:
                                                                          AclColors
                                                                              .red,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child:
                                                                      const Center(
                                                                    child: Icon(
                                                                      Icons.close,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text('Hapus'),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 16.0),
                                                    // Spacer
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : ButtonWidgetCustom(
                                        text: "Tambah",
                                        backgroudColor: AclColors.greyDivider,
                                        textColor: AclColors.black,
                                        function: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AddEducationDialog(
                                                onCancelPressed: () =>
                                                    Navigator.pop(context),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Divider(),
                                ),
                                const SizedBox(height: 16),
                                ButtonWidgetCustom(
                                  text: "lanjut",
                                  function: () {
                                    setState(() {
                                      isCheck = true;
                                    });

                                    getIt<FaaCandidatePageBloc>()
                                        .add(SubmitEducationEvent());
                                  },
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              state.submitStatus.isInProgress?
              Container(
                  color: Colors.white.withAlpha(90),
                  child: const Center(
                      child: ProgressDialog(
                        title: '',
                        isProgressed: true,
                      )))
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
