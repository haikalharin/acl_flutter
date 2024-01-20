import 'package:acl_flutter/common/app_string.dart';
import 'package:acl_flutter/core/widget/dropdown/drop_down_gender.dart';
import 'package:acl_flutter/core/widget/dropdown/drop_down_general.dart';
import 'package:acl_flutter/screens/faa_form_candidate/bloc/faa_candidate_page_bloc.dart';
import 'package:acl_flutter/screens/faa_form_candidate/bloc/faa_candidate_page_bloc.dart';
import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dialog/retry_dialog.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/dropdown/drop_down_marital_status.dart';
import '../../../../core/widget/dropdown/drop_down_string.dart';
import '../../../../core/widget/dropdown/drop_down_string_underline.dart';
import '../../../../core/widget/text_input.dart';
import '../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../di.dart';
import '../expansion_widget/work_experience/add_work_experience_dialog.dart';

class WorkExperienceDataPage extends StatefulWidget {
  const WorkExperienceDataPage({super.key});

  @override
  State<WorkExperienceDataPage> createState() => _WorkExperienceDataPageState();
}

class _WorkExperienceDataPageState extends State<WorkExperienceDataPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool isEmployee = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaaCandidatePageBloc, FaaCandidatePageState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                                    state.addCompanyModel?.companyType != null
                                ? Card(
                                    margin: const EdgeInsets.all(16.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 8),
                                            padding: EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: AclColors.primaryBlue,
                                                shape: BoxShape.circle),
                                            child: const Center(
                                              child: Icon(
                                                Icons.chrome_reader_mode_outlined,
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
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AddWorkExperienceDialog(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(),
                            ),
                            const SizedBox(height: 16),
                            DropDownStringUnderline(
                              title: AppString.textExperience,
                              displayClearIcon: false,
                              icon: const Icon(
                                Icons.add_chart,
                                color: AclColors.greyDarkFontColor,
                              ),
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(CheckEmployeeInputEvent(value));
                              },
                              initialItem: 'Tidak',
                              items: const ['Ya', 'Tidak'],
                              errorText:
                                  isCheck && state.checkIsEmployee.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                            ),
                            state.checkIsEmployee.value.isNotEmpty &&
                                    state.checkIsEmployee.value == 'Ya'
                                ? Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      TextInput(
                                        icon: const Icon(Icons.maps_home_work),
                                        label: const Text("Nama Unit"),
                                        // initialValue: postTitle,
                                        validator: (String? value) {
                                          if (value!.isNotEmpty) return null;
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
                                        icon: const Icon(Icons.account_circle),
                                        label: const Text("Jabatan Terakhir"),
                                        // initialValue: postTitle,
                                        validator: (String? value) {
                                          if (value!.isNotEmpty) return null;
                                          return "Mohon diisi";
                                        },
                                        onChanged: (String value) {
                                          getIt<FaaCandidatePageBloc>().add(
                                              LastDepartmentExperienceInputEvent(
                                                  value));
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                      TextInput(
                                        icon: const Icon(Icons.person),
                                        label: const Text("Atasan langsung"),
                                        // initialValue: postTitle,
                                        validator: (String? value) {
                                          if (value!.isNotEmpty) return null;
                                          return "Mohon diisi";
                                        },
                                        onChanged: (String value) {
                                          getIt<FaaCandidatePageBloc>().add(
                                              DirectLeaderExperienceInputEvent(
                                                  value));
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                      BlocBuilder<FaaCandidatePageBloc,
                                          FaaCandidatePageState>(
                                        // buildWhen: (current, previous) =>
                                        //     current.provinceId != previous.provinceId ||
                                        //     current.masterDataModel !=
                                        //         previous.masterDataModel,
                                        builder: (context, state) {
                                          return DropDownGeneral(
                                            title: 'Status saat ini',
                                            icon: const Icon(
                                              Icons.group,
                                              color:
                                                  AclColors.greyDarkFontColor,
                                            ),
                                            onChanged: (AajicityMasterReference
                                                value) {
                                              // getIt<FaaCandidatePageBloc>()
                                              //     .add(ProvinceInputEvent(value));
                                            },
                                            initialItem: state
                                                            .candidateDataModel !=
                                                        null &&
                                                    state
                                                            .candidateDataModel
                                                            ?.data
                                                            ?.maritalStatus !=
                                                        0
                                                ? state
                                                    .masterDataModel
                                                    ?.masterData
                                                    ?.masterReferenceAll
                                                    ?.maritalstatus
                                                    ?.masterReference
                                                    ?.where((element) =>
                                                        element.id ==
                                                        (state
                                                                .candidateDataModel
                                                                ?.data
                                                                ?.maritalStatus ??
                                                            0))
                                                    .toList()
                                                    .first
                                                : null,
                                            items: state
                                                    .masterDataModel
                                                    ?.masterData
                                                    ?.masterReferenceAll
                                                    ?.maritalstatus
                                                    ?.masterReference ??
                                                [],
                                            errorText: isCheck == true &&
                                                    state
                                                        .recentStatus.isNotValid
                                                ? 'Mohon diisi'
                                                : null,
                                          );
                                        },
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
                                // Navigator.of(context).pushNamed(
                                //   Routes.loginPage,
                                // );
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
          );
        },
      ),
    );
  }
}
