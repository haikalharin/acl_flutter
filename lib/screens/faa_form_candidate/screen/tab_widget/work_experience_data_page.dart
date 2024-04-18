import 'package:acl_flutter/common/app_string.dart';
import 'package:acl_flutter/common/widget/dropdown/drop_down_general.dart';
import 'package:acl_flutter/data/model/candidate/candidate_data_model.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/work_experience/add_work_experience_reinstance_dialog.dart';
import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/dialog/progress_dialog.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../common/widget/button_widget.dart';
import '../../../../common/widget/dropdown/drop_down_string.dart';
import '../../../../common/widget/dropdown/drop_down_string_underline.dart';
import '../../../../common/widget/text_input.dart';
import '../../../../di.dart';
import '../../bloc/faa_candidate_page_bloc.dart';
import '../expansion_widget/work_experience/add_work_experience_dialog.dart';

class WorkExperienceDataPage extends StatefulWidget {
  final TabController tabController;

  const WorkExperienceDataPage({super.key, required this.tabController});

  @override
  State<WorkExperienceDataPage> createState() => _WorkExperienceDataPageState();
}

class _WorkExperienceDataPageState extends State<WorkExperienceDataPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool isEmployee = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaaCandidatePageBloc, FaaCandidatePageState>(
      listener: (context, state) async {
        if (state.submitStatus.isSuccess) {
          if (state.message == 'success-submit-work-experience') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  title: "Berhasil input pengalaman kerja",
                  isProgressed: false,
                );
              },
            );
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
            widget.tabController.animateTo(2);
          } else if (state.message ==
              'success-put-work-experience-reinstance') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  title: "Berhasil update pengalaman kerja",
                  isProgressed: false,
                );
              },
            );
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
            widget.tabController.animateTo(2);
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
                                state.addCompanyModel != null &&
                                        state.addCompanyModel?.companyType !=
                                            null
                                    ? Card(
                                        margin: const EdgeInsets.all(16.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                padding: EdgeInsets.all(4),
                                                decoration: const BoxDecoration(
                                                    color:
                                                        AclColors.primaryBlue,
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
                                                    Text(state.addCompanyModel
                                                            ?.companyName ??
                                                        ''),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                        '${state.addCompanyModel?.startWorkingDate?.year ?? ''}-'
                                                        '${state.addCompanyModel?.endWorkingDate?.year ?? ''}'),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AddWorkExperienceDialog(
                                                                    onCancelPressed: () =>
                                                                        Navigator.pop(
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
                                                                  color:
                                                                      AclColors
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
                                                                      color: AclColors
                                                                          .red,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child:
                                                                      const Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
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
                                                    const SizedBox(
                                                        height: 16.0),
                                                    // Spacer
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : ButtonWidgetCustom(
                                        text: "Tambah Pekerjaan",
                                        backgroudColor: AclColors.greyDivider,
                                        textColor: AclColors.greyDarkFontColor,
                                        function: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AddWorkExperienceDialog(
                                                onCancelPressed: () =>
                                                    Navigator.pop(context),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Divider(),
                                ),
                                const SizedBox(height: 16),
                                DropDownString(
                                  title: AppString.textExperience,
                                  displayClearIcon: false,
                                  icon: const Icon(
                                    Icons.add_chart,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (String value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(CheckEmployeeInputEvent(value));
                                    if (value.toLowerCase() == 'ya') {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddWorkExperienceReinstanceDialog(
                                            onCancelPressed: () =>
                                                Navigator.pop(context),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  initialItem: state.checkIsEmployee.isValid
                                      ? state.checkIsEmployee.value
                                      : 'Tidak',
                                  items: const ['Ya', 'Tidak'],
                                  errorText: isCheck &&
                                          state.checkIsEmployee.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                ),
                                state.checkIsEmployee.value.isNotEmpty &&
                                        state.checkIsEmployee.value == 'Ya'
                                    ? Column(
                                        children: [
                                          const SizedBox(height: 8),
                                          TextInput(
                                            icon: const Icon(
                                                Icons.maps_home_work),
                                            initialValue: state.unitName.isValid
                                                ? state.unitName.value
                                                : null,
                                            labelText: "Nama Unit",
                                            validator: (String? value) {
                                              if (value!.isNotEmpty)
                                                return null;
                                              return "Mohon diisi";
                                            },
                                            onChanged: (String value) {
                                              getIt<FaaCandidatePageBloc>().add(
                                                  UnitNameExperienceInputEvent(
                                                      value));
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          TextInput(
                                            icon: const Icon(
                                                Icons.account_circle),
                                            initialValue:
                                                state.lastPosition.isValid
                                                    ? state.lastPosition.value
                                                    : null,
                                            labelText: "Jabatan Terakhir",
                                            // initialValue: postTitle,
                                            validator: (String? value) {
                                              if (value!.isNotEmpty)
                                                return null;
                                              return "Mohon diisi";
                                            },
                                            onChanged: (String value) {
                                              getIt<FaaCandidatePageBloc>().add(
                                                  LastPositionExperienceInputEvent(
                                                      value));
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          TextInput(
                                            icon: const Icon(Icons.person),
                                            initialValue:
                                                state.directLeader.isValid
                                                    ? state.directLeader.value
                                                    : null,
                                            labelText: "Atasan langsung",
                                            // initialValue: postTitle,
                                            validator: (String? value) {
                                              if (value!.isNotEmpty)
                                                return null;
                                              return "Mohon diisi";
                                            },
                                            onChanged: (String value) {
                                              getIt<FaaCandidatePageBloc>().add(
                                                  DirectLeaderExperienceInputEvent(
                                                      value));
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          DropDownString(
                                            title: 'Status',
                                            displayClearIcon: false,
                                            icon: const Icon(
                                              Icons.add_chart,
                                              color:
                                                  AclColors.greyDarkFontColor,
                                            ),
                                            onChanged: (String value) {
                                              getIt<FaaCandidatePageBloc>().add(
                                                  StatusEmployeeInputEvent(
                                                      value));
                                            },
                                            initialItem:
                                                state.statusEmployee.isValid
                                                    ? state.statusEmployee.value
                                                    : 'Tidak',
                                            items: const ['Ya', 'Tidak'],
                                            errorText: isCheck &&
                                                    state.checkIsEmployee
                                                        .isNotValid
                                                ? 'Mohon diisi'
                                                : null,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                const SizedBox(height: 8),
                                ButtonWidgetCustom(
                                  text: "lanjut",
                                  function: () {
                                    setState(() {
                                      isCheck = true;
                                    });
                                    getIt<FaaCandidatePageBloc>()
                                        .add(SubmitWorkingExperienceEvent());
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
              state.submitStatus.isInProgress
                  ? Container(
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
