import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_helper/source/components/buttons/adaptive_button.dart';
import 'package:formz/formz.dart';

import '../../../../../common/widget/button_widget.dart';
import '../../../../../common/widget/custom_check.dart';
import '../../../../../common/widget/date_time_picker_form.dart';
import '../../../../../common/widget/dropdown/drop_down_string.dart';
import '../../../../../common/widget/spinkit_indicator.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../../../di.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';

class AddWorkExperienceReinstanceDialog extends StatefulWidget {
  const AddWorkExperienceReinstanceDialog(
      {Key? key,
      required this.onCancelPressed,
      this.onRetryPressed})
      : super(key: key);

  final VoidCallback? onRetryPressed;
  final VoidCallback? onCancelPressed;

  @override
  State<AddWorkExperienceReinstanceDialog> createState() =>
      _AddWorkExperienceReinstanceDialogState();
}

class _AddWorkExperienceReinstanceDialogState extends State<AddWorkExperienceReinstanceDialog> {
  bool checkedValueStillWorking = false;
  bool isCheck = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      const Text("Tambah Pekerjaan"),
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
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: formKey,
                        child: Column(
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
                        ),
                      ),
                    ),
                    state.submitStatus.isInProgress
                        ? Center(
                          child: Container(
                              color: Colors.white.withAlpha(90),
                              child: const Center(
                                  child:
                                      SpinKitIndicator(type: SpinKitType.circle))),
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
                            .add(PutWorkExperienceReinstanceEvent());
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
