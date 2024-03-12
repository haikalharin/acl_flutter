import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widget/custom_image_picker.dart';
import '../../../../../common/widget/date_time_picker_form.dart';
import '../../../../../common/widget/dropdown/drop_down_general.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';

import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';

enum Mode { create, update }

class AajiData extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const AajiData({super.key, required this.formKey});

  @override
  State<AajiData> createState() => _AajiDataState();
}

class _AajiDataState extends State<AajiData> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAUI = false;
  bool checkedValueMarriage = false;
  bool checkedValueKpm = false;
  bool checkedValueResign = false;
  bool checkedValueLastDateAAJI = false;
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
            'Data AAJI',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          collapsedBackgroundColor: AclColors.greyDivider,
          children: <Widget>[
            BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            DropDownGeneral(
                              title: 'Perusahaan sebelumnya',
                              isMandatory: state.checkedPrevCompanyValueAAJI,
                              readOnly: state.checkedPrevCompanyValueAAJI,
                              icon: const Icon(
                                Icons.add_chart,
                                color: AclColors.greyDarkFontColor,
                              ),
                              onChanged: (AajicityMasterReference value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiPrevCompanyInputEvent(value));
                              },
                              initialItem: state
                                  .masterDataModel
                                  ?.masterData
                                  ?.masterReferenceAll
                                  ?.prevcompany
                                  ?.masterReference
                                  ?.where((element) =>
                                      element.id ==
                                      (state.prevCompanyAAJIId.value))
                                  .toList()
                                  .first,
                              items: state
                                      .masterDataModel
                                      ?.masterData
                                      ?.masterReferenceAll
                                      ?.prevcompany
                                      ?.masterReference ??
                                  [],
                              errorText: state.checkedPrevCompanyValueAAJI &&
                                      isCheck &&
                                      state.prevCompanyAAJIId.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              isMandatory: state.checkedValueAAJI,
                              icon: const Icon(Icons.add_card_rounded),
                              labelText: "No lisensi AAJI",
                              readOnly: state.checkedValueAAJI,
                              initialValue: state.candidateDataModel?.aajiNo,
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiNoInputEvent(value));
                              },
                              validator: (String? value) {
                                if (checkedValueAAJI) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                            CheckboxListTile(
                              title: const Text("Isi tanggal Akhir AAJI"),
                              value: checkedValueLastDateAAJI,
                              onChanged: (newValue) {
                                getIt<FaaCandidatePageBloc>().add(
                                    AajiLastDateCheckedInputEvent(
                                        newValue ?? false));
                                setState(() {
                                  checkedValueLastDateAAJI = newValue ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            checkedValueLastDateAAJI
                                ? const SizedBox(height: 8)
                                : Container(),
                            if (checkedValueLastDateAAJI)
                              DateTimePickerForm(
                                dateTime:
                                    mode == Mode.update ? DateTime.now() : null,
                                labelText: "Pilih Tanggal",
                                title: "Tanggal Akhir AAJI",
                                errorText: isCheck == true &&
                                        state.dateLastDateValueAAJIString
                                            .isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                                isMandatory: checkedValueLastDateAAJI,
                                selectedDateTime: (DateTime date) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AajiLastDateInputEvent(date));
                                },
                                validator: (String? value) {
                                  if (checkedValueLastDateAAJI) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  } else {
                                    return null;
                                  }
                                },
                              )
                            else
                              Container(),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Surat Terminasi/Pengunduran Diri',
                              isMandatory: false,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiTerminationImageInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Surat Tidak Melakukan Twisting',
                              isMandatory: false,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiTerminationImageInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Foto Kartu AAJI',
                              isMandatory: state.checkedValueAAJI,
                              readOnly: state.checkedValueAAJI,
                              initialImage: state.imageLicenceAAJI.value,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiImageInputEvent(value));
                              },
                              errorText: checkedValueAAJI &&
                                      isCheck &&
                                      state.imageLicenceAAJI.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Hasil Aktivasi Mobile Exam AAJI',
                              isMandatory: false,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AajiMobileActivationExamImageInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 16),
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
