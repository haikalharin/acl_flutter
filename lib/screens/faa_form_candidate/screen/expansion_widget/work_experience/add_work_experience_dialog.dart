import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/widget/button_widget.dart';
import '../../../../../core/widget/custom_check.dart';
import '../../../../../core/widget/date_time_picker_form.dart';
import '../../../../../core/widget/spinkit_indicator.dart';
import '../../../../../core/widget/text_input.dart';
import '../../../../../di.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';

class AddWorkExperienceDialog extends StatefulWidget {
  const AddWorkExperienceDialog(
      {Key? key,
      required this.onCancelPressed,
      this.onRetryPressed})
      : super(key: key);

  final VoidCallback? onRetryPressed;
  final VoidCallback? onCancelPressed;

  @override
  State<AddWorkExperienceDialog> createState() =>
      _AddWorkExperienceDialogState();
}

class _AddWorkExperienceDialogState extends State<AddWorkExperienceDialog> {
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
                          children: <Widget>[
                            const SizedBox(height: 8),
                            TextInput(
                              initialValue: state.addCompanyModel?.companyName,
                              icon: const Icon(Icons.person),
                              labelText: "Nama perusahaan",
                              // initialValue: postTitle,
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>().add(
                                    CompanyNameExperienceInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              initialValue: state.addCompanyModel?.companyType,
                              icon: const Icon(Icons.work),
                              labelText: "Jenis perusahaan",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>().add(
                                    CompanyTypeExperienceInputEvent(value));
                              },
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              initialValue: state.addCompanyModel?.department,
                              icon: const Icon(Icons.maps_home_work_outlined),
                              labelText: "jabatan",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(DepartmentExperienceInputEvent(value));
                              },
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                            ),
                            const SizedBox(height: 8),
                            DateTimePickerForm(
                              dateTime:
                                  state.addCompanyModel?.startWorking != null
                                      ? DateTime.parse(
                                          state.addCompanyModel?.startWorking ??
                                              '2020-01-01',
                                        )
                                      : null,
                              labelText: "Pilih Tanggal",
                              title: "Mulai masa bekerja",
                              errorText: isCheck == true &&
                                      state.startWorking.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                              selectedDateTime: (DateTime date) {
                                getIt<FaaCandidatePageBloc>().add(
                                    StartWorkingExperienceInputEvent(date));
                              },
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return CustomCheck(
                                  lable: const Text("Masih Bekerja"),
                                  initialItem: checkedValueStillWorking,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValueStillWorking = newValue;
                                    });
                                    var date = DateTime.now();
                                    getIt<FaaCandidatePageBloc>().add(
                                        EndWorkingExperienceInputEvent(date));
                                    getIt<FaaCandidatePageBloc>().add(
                                        CheckStillWorkingInputEvent(newValue));
                                  },
                                );
                              },
                            ),
                            !checkedValueStillWorking
                                ? const SizedBox(height: 8)
                                : Container(),
                            !checkedValueStillWorking
                                ? DateTimePickerForm(
                                    dateTime: state
                                                .addCompanyModel?.endWorking !=
                                            null
                                        ? DateTime.parse(
                                            state.addCompanyModel?.endWorking ??
                                                '2020-01-01',
                                          )
                                        : null,
                                    labelText: "Pilih Tanggal",
                                    title: "Berakhir masa bekerja",
                                    errorText: isCheck == true &&
                                            state.endWorking.isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                    selectedDateTime: (DateTime date) {
                                      getIt<FaaCandidatePageBloc>().add(
                                          EndWorkingExperienceInputEvent(date));
                                    },
                                    validator: (String? value) {
                                      if (value!.isNotEmpty) return null;
                                      return "Mohon diisi";
                                    },
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    state.submitStatus.isInProgress
                        ? Container(
                            color: Colors.white.withAlpha(90),
                            child: const Center(
                                child:
                                    SpinKitIndicator(type: SpinKitType.circle)))
                        : Container(),
                  ],
                ),
                actions: <Widget>[
                  ButtonWidgetCustom(
                    text: "Tambah",
                    function: () {
                      if (formKey.currentState!.validate()) {
                        getIt<FaaCandidatePageBloc>()
                            .add(AddWorkingExperienceEvent());
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
