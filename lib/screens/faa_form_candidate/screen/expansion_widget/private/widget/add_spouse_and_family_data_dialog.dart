import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_helper/source/components/buttons/adaptive_button.dart';
import 'package:formz/formz.dart';

import '../../../../../../common/app_string.dart';
import '../../../../../../common/widget/custom_check.dart';
import '../../../../../../common/widget/date_time_picker_form.dart';
import '../../../../../../common/widget/dropdown/drop_down_general.dart';
import '../../../../../../common/widget/dropdown/drop_down_general_faa.dart';
import '../../../../../../common/widget/dropdown/drop_down_general_second_faa.dart';
import '../../../../../../common/widget/dropdown/drop_down_string.dart';
import '../../../../../../common/widget/spinkit_indicator.dart';
import '../../../../../../common/widget/text_input.dart';
import '../../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../../di.dart';
import '../../../../bloc/faa_candidate_page_bloc.dart';

class AddSpouseAndFamilyDataDialog extends StatefulWidget {
  const AddSpouseAndFamilyDataDialog({Key? key,
    required this.putDataType,
     this.id,
     this.onSubmitPressed,

    this.onRetryPressed})
      : super(key: key);

  final PutDataType putDataType;
  final int? id;

  final VoidCallback? onRetryPressed;
  final VoidCallback? onSubmitPressed;

  @override
  State<AddSpouseAndFamilyDataDialog> createState() =>
      _AddSpouseAndFamilyDataDialogState();
}

class _AddSpouseAndFamilyDataDialogState
    extends State<AddSpouseAndFamilyDataDialog> {
  bool checkedValueStillWorking = false;
  bool isCheck = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getIt<FaaCandidatePageBloc>()
        .add(PutDataTypeEvent(widget.putDataType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: BlocListener<FaaCandidatePageBloc, FaaCandidatePageState>(
          listener: (context, state) {
            if (state.submitStatus.isSuccess) {
              if (state.message == 'success-add-experience') {
                Navigator.pop(context);
              }
            }
          },
          child: BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
            builder: (context, state) {
              return AlertDialog(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tambah Data"),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "✕",
                            style: TextStyle(color: AclColors.grey),
                          )),
                    ]),
                insetPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                actionsAlignment: MainAxisAlignment.center,
                scrollable: true,
                content: Stack(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            widget.putDataType ==
                                PutDataType.isAgentInAllianz ||
                                widget.putDataType ==
                                    PutDataType.isAgentInOthers ||
                                widget.putDataType ==
                                    PutDataType.isEmployeeInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: TextInput(
                                initialValue:
                                state.addCompanyModel?.companyName,
                                icon: const Icon(Icons.person),
                                labelText: "Nama",
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyPersonNameInputEvent(value));
                                },
                              ),
                            )
                                : Container(),
                            widget.putDataType ==
                                PutDataType.isAgentInAllianz ||
                                widget.putDataType ==
                                    PutDataType.isAgentInOthers ||
                                widget.putDataType ==
                                    PutDataType.isEmployeeInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                builder: (context, state) {
                                  return DropDownGeneralSecondFaa(
                                    title: 'Hubungan',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged:
                                        (CityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>().add(
                                          FamilyPersonRelationInputEvent(
                                              value));
                                    },
                                    initialItem: state
                                        .familyPersonRelationId.isValid
                                        ? state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.heirrelation
                                        ?.masterReference
                                        ?.where((element) =>
                                    element.id ==
                                        (state
                                            .familyPersonRelationId
                                            .value))
                                        .toList()
                                        .first
                                        : null,
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.heirrelation
                                        ?.masterReference ??
                                        [],
                                    errorText: isCheck == true &&
                                        state.familyPersonRelationId
                                            .isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                  );
                                },
                              ),
                            )
                                : Container(),
                            widget.putDataType == PutDataType.isAgentInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: TextInput(
                                initialValue:
                                state.addCompanyModel?.companyName,
                                icon: const Icon(Icons.person),
                                labelText: "Nama Direct",
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyDirectNameInputEvent(value));
                                },
                              ),
                            )
                                : Container(),
                            widget.putDataType == PutDataType.isAgentInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                builder: (context, state) {
                                  return DropDownGeneralFaa(
                                    title: 'Jabatan',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged:
                                        (AajicityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>().add(
                                          FamilyPositionInputEvent(
                                              value));
                                    },
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.position
                                        ?.masterReference ??
                                        [],
                                    errorText: isCheck == true &&
                                        state.familyPositionId
                                            .isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                  );
                                },
                              ),
                            )
                                : Container(),
                            widget.putDataType == PutDataType.isAgentInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: TextInput(
                                initialValue:
                                state.addCompanyModel?.companyName,
                                icon: const Icon(Icons.person),
                                labelText: "Kode Agen",
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyAgentCodeInputEvent(value));
                                },
                              ),
                            )
                                : Container(),
                            widget.putDataType ==
                                PutDataType.isEmployeeInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: TextInput(
                                icon: const Icon(Icons.person),
                                labelText: "Department",
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyDepartmentInputEvent(value));
                                },
                              ),
                            )
                                : Container(),

                            widget.putDataType == PutDataType.isAgentInAllianz
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: DropDownString(
                                title: 'Nama Perusahaan Grup Allianz',
                                displayClearIcon: false,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyCompanyInputEvent(value));

                                  // checkedIsAgentInAllianz = true;
                                },
                                initialItem: state.checkIsEmployee.isValid
                                    ? state.checkIsEmployee.value
                                    : null,
                                items: const [
                                  'PT. Asuransi Allianz Life Indonesia',
                                  'PT. Asuransi Allianz Life Indonesia',
                                  'PT. Asuransi Allianz Life Indonesia'
                                ],
                                errorText: isCheck &&
                                    state.familyCompany.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                            )
                                : Container(),
                            widget.putDataType == PutDataType.isAgentInOthers
                                ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: TextInput(
                                initialValue:
                                state.addCompanyModel?.companyName,
                                icon: const Icon(Icons.person),
                                labelText: "Nama Perusahaan Asuransi Lain",
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      FamilyCompanyInputEvent(value));
                                },
                              ),
                            )
                                : Container(),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    state.submitStatus.isInProgress
                        ? Center(
                      child: Container(
                          color: Colors.white.withAlpha(90),
                          child: const Center(
                              child: SpinKitIndicator(
                                  type: SpinKitType.circle))),
                    )
                        : Container(),
                  ],
                ),
                actions: <Widget>[
                  AdaptiveButton(
                    titleText: "Tambah",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        getIt<FaaCandidatePageBloc>()
                            .add(
                            SubmitFamiliesDataEvent(widget.putDataType, id:widget.id));
                      }
                      setState(() {
                        isCheck = true;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ));
  }
}
