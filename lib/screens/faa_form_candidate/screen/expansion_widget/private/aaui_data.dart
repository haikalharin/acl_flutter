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
class AauiData extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const AauiData({super.key, required this.formKey});

  @override
  State<AauiData> createState() => _AauiDataState();
}

class _AauiDataState extends State<AauiData> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAASI = false;
  bool checkedValueAAUI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAJI = false;
  bool checkedValueMarriage = false;
  bool checkedValueKpm = false;
  bool checkedValueResign = false;
  bool checkedValueLastDateAAUI = false;
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
    return  SingleChildScrollView(
      child: Card(
        child: ExpansionTile(
            title: const Text(
              'Data AAUI',
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
                                isMandatory: state.checkedPrevCompanyValueAAUI,
                                readOnly: state.checkedPrevCompanyValueAAUI,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (AajicityMasterReference value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiPrevCompanyInputEvent(value));
                                },
                                items: state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.prevcompany
                                    ?.masterReference ??
                                    [],
                                errorText:state.checkedPrevCompanyValueAAUI && isCheck && state.prevCompanyAAUIId.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory:  state.checkedValueAAUI,
                                icon: const Icon(Icons.add_card_rounded),
                                readOnly:state.checkedValueAAUI,
                                initialValue:
                                state.candidateDataModel?.aauiNo,
                                labelText: "No lisensi AAUI",
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiNoInputEvent(value));
                                },
                                validator: (String? value) {
                                  if (checkedValueAAUI) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 8),
                              CheckboxListTile(
                                title: const Text("Isi tanggal Akhir AAUI"),
                                value: checkedValueLastDateAAUI,
                                onChanged: (newValue) {
                                  getIt<FaaCandidatePageBloc>().add(
                                      AauiLastDateCheckedInputEvent(
                                          newValue ?? false));
                                  setState(() {
                                    checkedValueLastDateAAUI = newValue ?? false;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              checkedValueLastDateAAUI
                                  ? const SizedBox(height: 8)
                                  : Container(),
                              if (checkedValueLastDateAAUI)
                                DateTimePickerForm(
                                  dateTime:
                                  mode == Mode.update ? DateTime.now() : null,
                                  labelText: "Pilih Tanggal",
                                  title: "Tanggal Akhir AAUI",
                                  errorText: isCheck == true &&
                                      state.dateLastDateValueAAUIString
                                          .isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                  isMandatory: checkedValueLastDateAAUI,
                                  selectedDateTime: (DateTime date) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(AauiLastDateInputEvent(date));
                                  },
                                  validator: (String? value) {
                                    if (checkedValueLastDateAAUI) {
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
                                      .add(AauiTerminationImageInputEvent(value));
                                },
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Surat Tidak Melakukan Twisting',
                                isMandatory: false,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiTerminationImageInputEvent(value));
                                },
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Foto Lisensi AAUI',
                                isMandatory: checkedValueAAUI,
                                readOnly:state.checkedValueAAUI,
                                initialImage: state.imageLicenceAAUI.value,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiImageInputEvent(value));
                                },
                                errorText: checkedValueAAUI && isCheck &&
                                    state.imageLicenceAAUI.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Hasil Aktivasi Mobile Exam AAUI',
                                isMandatory: false,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiMobileActivationExamImageInputEvent(value));
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
