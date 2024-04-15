import 'package:acl_flutter/common/widget/dropdown/drop_down_string.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/widget/add_spouse_and_family_data_dialog.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/widget/custom_card_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/app_string.dart';
import '../../../../../common/widget/button_widget.dart';
import '../../../../../common/widget/dropdown/drop_down_general_faa.dart';
import '../../../../../common/widget/dropdown/drop_down_general_second_faa.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../../../data/model/candidate_faa/response_families_data.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';
import '../work_experience/add_work_experience_dialog.dart';

enum Mode { create, update }

class SpouseAndFamilyStatusData extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SpouseAndFamilyStatusData({super.key, required this.formKey});

  @override
  State<SpouseAndFamilyStatusData> createState() =>
      _SpouseAndFamilyStatusDataState();
}

class _SpouseAndFamilyStatusDataState extends State<SpouseAndFamilyStatusData> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAUI = false;
  bool checkedValueMarriage = false;
  bool checkedIsAgentInAllianz = false;
  bool checkedIsAgentOthers = false;
  bool checkedIsEmployee = false;
  bool checkedValueResign = false;
  bool checkedValueTerminasi = false;
  var data = [
    LoginModel(name: 'adadada', uid: '1'),
    LoginModel(name: 'bccccc', uid: '2'),
    LoginModel(name: 'cfffffff', uid: '3'),
    LoginModel(name: 'dggggg', uid: '4'),
    LoginModel(name: 'errrrr', uid: '5'),
    LoginModel(name: 'fuuuuu', uid: '6'),
  ];

  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Card(
        child: ExpansionTile(
          title: const Text(
            'Data pasangan dan keluarga',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          collapsedBackgroundColor: AclColors.greyDivider,
          children: <Widget>[
            BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
              builder: (context, state) {
                List<Widget> listWidgetIsAgentInAllianz = [
                  CustomCardListBuilder(
                      onEditPressed: (data) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddSpouseAndFamilyDataDialog(
                              id: data.id,
                              putDataType: PutDataType.isAgentInAllianz,
                              onSubmitPressed: () => Navigator.pop(
                                context,
                              ),
                            );
                          },
                        );
                      },
                      onDeletePressed: (data) {},
                      responseFamiliesData: ResponseFamiliesData()),
                ];

                List<Widget> listWidgetIsAgentInOthers = [
                  CustomCardListBuilder(
                      onEditPressed: (data) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddSpouseAndFamilyDataDialog(
                              id: data.id,
                              putDataType: PutDataType.isAgentInOthers,
                              onSubmitPressed: () => Navigator.pop(
                                context,
                              ),
                            );
                          },
                        );
                      },
                      onDeletePressed: (data) {},
                      responseFamiliesData: ResponseFamiliesData()),
                ];

                List<Widget> listWidgetIsEmployeeInAllianz = [
                  CustomCardListBuilder(
                      onEditPressed: (data) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddSpouseAndFamilyDataDialog(
                              id: data.id,
                              putDataType: PutDataType.isEmployeeInAllianz,
                              onSubmitPressed: () => Navigator.pop(
                                context,
                              ),
                            );
                          },
                        );
                      },
                      onDeletePressed: (data) {},
                      responseFamiliesData: ResponseFamiliesData()),
                ];

                if (state.listFamilyIsAgent != null &&
                    (state.listFamilyIsAgent ?? []).isNotEmpty) {
                  state.listFamilyIsAgent?.forEach((element) {
                    listWidgetIsAgentInAllianz.add(CustomCardListBuilder(
                        onEditPressed: (data) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddSpouseAndFamilyDataDialog(
                                id: data.id,
                                putDataType: PutDataType.isAgentInAllianz,
                                onSubmitPressed: () => Navigator.pop(
                                  context,
                                ),
                              );
                            },
                          );
                        },
                        responseFamiliesData: element));
                  });
                }

                if (state.listFamilyIsAgentOthers != null &&
                    (state.listFamilyIsAgentOthers ?? []).isNotEmpty) {
                  state.listFamilyIsAgentOthers?.forEach((element) {
                    listWidgetIsAgentInOthers.add(CustomCardListBuilder(
                        onEditPressed: (data) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddSpouseAndFamilyDataDialog(
                                id: data.id,
                                putDataType: PutDataType.isAgentInOthers,
                                onSubmitPressed: () => Navigator.pop(
                                  context,
                                ),
                              );
                            },
                          );
                        },
                        responseFamiliesData: element));
                  });
                }

                if (state.listFamilyIsEmploye != null &&
                    (state.listFamilyIsEmploye ?? []).isNotEmpty) {
                  state.listFamilyIsEmploye?.forEach((element) {
                    listWidgetIsEmployeeInAllianz.add(CustomCardListBuilder(
                        onEditPressed: (data) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddSpouseAndFamilyDataDialog(
                                id: data.id,
                                putDataType: PutDataType.isEmployeeInAllianz,
                                onSubmitPressed: () => Navigator.pop(
                                  context,
                                ),
                              );
                            },
                          );
                        },
                        responseFamiliesData: element));
                  });
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: DropDownString(
                                title: AppString.textSpouseIsAgentInAllianz,
                                displayClearIcon: false,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (String value) {
                                  // getIt<FaaCandidatePageBloc>()
                                  //     .add(CheckEmployeeInputEvent(value));
                                  checkedIsAgentInAllianz =
                                      value == 'Ya' ? true : false;
                                },
                                initialItem: 'Tidak',
                                items: const ['Ya', 'Tidak'],
                              ),
                            ),
                            checkedIsAgentInAllianz
                                ? Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: [
                                        state.listFamilyIsAgent != null
                                            ? Column(
                                                children: listWidgetIsAgentInAllianz,
                                              )
                                            : Container(),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: ButtonWidgetCustom(
                                            text: "Tambah",
                                            backgroudColor:
                                                AclColors.blueButton,
                                            textColor: AclColors.white,
                                            function: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AddSpouseAndFamilyDataDialog(
                                                    onSubmitPressed: () =>
                                                        Navigator.pop(
                                                      context,
                                                    ),
                                                    putDataType: PutDataType
                                                        .isAgentInAllianz,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: DropDownString(
                                title: AppString.textSpouseIsAgentInAllianz,
                                displayClearIcon: false,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (String value) {
                                  // getIt<FaaCandidatePageBloc>()
                                  //     .add(CheckEmployeeInputEvent(value));
                                  checkedIsAgentOthers =
                                      value == 'Ya' ? true : false;
                                },
                                initialItem: 'Tidak',
                                items: const ['Ya', 'Tidak'],
                              ),
                            ),
                            checkedIsAgentOthers
                                ? Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: [
                                        state.listFamilyIsAgentOthers != null
                                            ? Column(
                                          children: listWidgetIsAgentInOthers,
                                        )
                                            : Container(),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: ButtonWidgetCustom(
                                            text: "Tambah",
                                            backgroudColor:
                                                AclColors.blueButton,
                                            textColor: AclColors.white,
                                            function: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AddSpouseAndFamilyDataDialog(
                                                    onSubmitPressed: () =>
                                                        Navigator.pop(
                                                      context,
                                                    ),
                                                    putDataType: PutDataType
                                                        .isAgentInOthers,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: DropDownString(
                                title: AppString.textSpouseIsAgentInAllianz,
                                displayClearIcon: false,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (String value) {
                                  // getIt<FaaCandidatePageBloc>()
                                  //     .add(CheckEmployeeInputEvent(value));
                                  checkedIsEmployee =
                                      value == 'Ya' ? true : false;
                                },
                                initialItem: 'Tidak',
                                items: const ['Ya', 'Tidak'],
                              ),
                            ),
                            checkedIsEmployee
                                ? Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: [
                                        state.listFamilyIsEmploye != null
                                            ? Column(
                                          children: listWidgetIsEmployeeInAllianz,
                                        )
                                            : Container(),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: ButtonWidgetCustom(
                                            text: "Tambah",
                                            backgroudColor:
                                                AclColors.blueButton,
                                            textColor: AclColors.white,
                                            function: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const AddSpouseAndFamilyDataDialog(
                                                    putDataType: PutDataType
                                                        .isEmployeeInAllianz,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),

                      // state.submitStatus.isFailure
                      //     ? showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return RetryDialog(
                      //       title: state.message ?? "Error",
                      //       onCancelPressed: () =>Navigator.pop(context),
                      //     );
                      //   },
                      // ): Container()
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
