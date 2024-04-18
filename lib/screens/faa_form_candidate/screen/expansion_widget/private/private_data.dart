import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widget/custom_image_picker.dart';
import '../../../../../common/widget/date_time_picker_form.dart';
import '../../../../../common/widget/dropdown/drop_down_general_faa.dart';
import '../../../../../common/widget/dropdown/drop_down_general_second_faa.dart';
import '../../../../../common/widget/dropdown/drop_down_general_third_faa.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';

enum Mode { create, update }

class PrivateData extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const PrivateData({super.key, required this.formKey});

  @override
  State<PrivateData> createState() => _PrivateDataState();
}

class _PrivateDataState extends State<PrivateData> {
  var firstName = TextEditingController(text: "aaaaaa");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;

  bool checkedValueKpm = false;
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
    return BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Card(
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const Text(
                'Pribadi',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              collapsedBackgroundColor: AclColors.greyDivider,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              icon: const Icon(Icons.person),
                              labelText: "Nama Depan(sesuai KTP)",
                              keyboardType: TextInputType.name,
                              initialValue: state.firstName.isValid
                                  ? state.firstName.value
                                  : null,
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(FirstNameInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              initialValue:
                                  state.candidateDataModel?.middleName,
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "Nama tengah(sesuai KTP)",
                              keyboardType: TextInputType.name,
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(MiddleNameInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              initialValue: state.candidateDataModel?.lastName,
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "Nama belakang(sesuai KTP)",
                              keyboardType: TextInputType.name,
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(LastNameInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 36),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  title: 'Jabatan',
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(PositionInputEvent(value));
                                  },
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.position
                                          ?.masterReference ??
                                      [],
                                  errorText: isCheck == true &&
                                          state.positionId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              initialValue: state.candidateDataModel?.idCardNo,
                              icon: const Icon(Icons.add_card_rounded),
                              labelText: "No KTP",
                              maxLength: 16,
                              keyboardType: TextInputType.phone,
                              validator: (String? value) {
                                if (state.identityNo.isNotValid) {
                                  return state.identityNo.invalidIdentityNo;
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(IdentityNoInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              initialValue: state.candidateDataModel?.idFamilyCardNo,
                              icon: const Icon(Icons.add_card_rounded),
                              labelText: "No KK",
                              maxLength: 16,
                              keyboardType: TextInputType.phone,
                              validator: (String? value) {
                                if (state.kkNo.isNotValid) {
                                  return state.kkNo.invalidIdentityNo;
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(KkNoInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 36),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  title: 'Status Pernikahan',
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(MartialStatusInputEvent(value));
                                  },
                                  initialItem: state.martialStatusId.isValid
                                      ? state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.maritalstatus
                                          ?.masterReference
                                          ?.where((element) =>
                                              element.id ==
                                              (state.martialStatusId.value))
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
                                          state.martialStatusId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              icon: const Icon(Icons.person),
                              labelText: "Tempat lahir",
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(PobInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            DateTimePickerForm(
                              readOnly: true,
                              dateTime: DateTime.parse(
                                state.candidateDataModel?.dob ?? '2020-01-01',
                              ),
                              labelText: "Pilih Tanggal",
                              title: "Tanggal lahir",
                              errorText:
                                  isCheck == true && state.dobString.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                              selectedDateTime: (DateTime date) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(DobInputEvent(date));
                              },
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                            ),
                            const SizedBox(height: 36),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  title: 'Jenis kelamin',
                                  icon: const Icon(
                                    Icons.add_chart,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(GenderInputEvent(value));
                                  },
                                  initialItem: state.candidateDataModel !=
                                              null &&
                                          state.candidateDataModel?.gender != 0
                                      ? state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.gender
                                          ?.masterReference
                                          ?.where((element) =>
                                              element.id ==
                                              (state.candidateDataModel
                                                      ?.gender ??
                                                  0))
                                          .toList()
                                          .first
                                      : null,
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.gender
                                          ?.masterReference ??
                                      [],
                                  errorText:
                                      isCheck && state.genderId.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              icon: const Icon(Icons.person),
                              readOnly: true,
                              labelText: "Warga Negara",
                              initialValue: "INDONESIA",
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(NationalityInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 36),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  title: 'Agama',
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(ReligionInputEvent(value));
                                  },
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.religion
                                          ?.masterReference ??
                                      [],
                                  errorText: isCheck == true &&
                                          state.religionId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              title: Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: const Text(
                                          'Alamat rumah (sesuai KTP)',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AclColors.greyDarkFontColor,
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, bottom: 5),
                                      child: const Text(
                                        '*',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: AclColors.red,
                                        ),
                                      ))
                                ],
                              ),
                              initialValue: state.candidateDataModel?.address1,
                              icon: const Icon(Icons.add_location),
                              labelText: "(Gedung.../Jalan...)",
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(AddressInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly:state.candidateDataModel?.address2!= null,
                              initialValue: state.candidateDataModel?.address2,
                              icon: const Icon(Icons.add_location),
                              labelText: "(RT.../RW...)",
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(RtRwInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: state.candidateDataModel?.address3!= null,
                              initialValue: state.candidateDataModel?.address3,
                              icon: const Icon(Icons.add_location),
                              labelText: "(Kelurahan.../Kecamatan...)",
                              validator: (String? value) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(KecKelInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              readOnly: true,
                              initialValue:
                                  state.candidateDataModel?.zipCode.toString(),
                              icon: const Icon(Icons.signpost_sharp),
                              labelText: "Kode Pos",
                              keyboardType: TextInputType.phone,
                              maxLength: 5,
                              validator: (String? value) {
                                if (state.postalCode.isNotValid) {
                                  return state.postalCode.invalidZipcode;
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(PostalCodeInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  title: 'Negara',
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(CountryInputEvent(value));
                                  },
                                  readOnly: true,
                                  initialItem: state
                                      .masterDataModel
                                      ?.masterData
                                      ?.masterReferenceAll
                                      ?.country
                                      ?.masterReference
                                      ?.where((element) => element.id == 744)
                                      .toList()
                                      .first,
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.country
                                          ?.masterReference
                                          ?.where(
                                              (element) => element.id == 744)
                                          .toList() ??
                                      [],
                                  errorText: isCheck == true &&
                                          state.countryId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              buildWhen: (current, previous) =>
                                  current.provinceId != previous.provinceId ||
                                  current.masterDataModel !=
                                      previous.masterDataModel,
                              builder: (context, state) {
                                return DropDownGeneralFaa(
                                  readOnly: true,
                                  title: 'Provinsi',
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(ProvinceInputEvent(value));
                                  },
                                  initialItem: state.provinceId.isValid
                                      ? state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.province
                                          ?.masterReference
                                          ?.where((element) =>
                                              element.id ==
                                              (state.provinceId.value))
                                          .toList()
                                          .first
                                      : null,
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.province
                                          ?.masterReference ??
                                      [],
                                  errorText: isCheck == true &&
                                          state.provinceId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              buildWhen: (current, previous) =>
                                  current.cityId != previous.cityId ||
                                  current.provinceId != previous.provinceId ||
                                  current.masterDataModel !=
                                      previous.masterDataModel ||
                                  current.candidateDataModel !=
                                      previous.candidateDataModel,
                              builder: (context, state) {
                                List<CityMasterReference> listCity =
                                    state.candidateDataModel?.province != 0
                                        ? state
                                                .masterDataModel
                                                ?.masterData
                                                ?.masterReferenceAll
                                                ?.city
                                                ?.masterReference
                                                ?.where((element) =>
                                                    element.referTo ==
                                                    state.candidateDataModel
                                                        ?.province)
                                                .toList() ??
                                            []
                                        : state
                                                .masterDataModel
                                                ?.masterData
                                                ?.masterReferenceAll
                                                ?.city
                                                ?.masterReference
                                                ?.where((element) =>
                                                    element.referTo ==
                                                    state.provinceId.value)
                                                .toList() ??
                                            [];
                                return DropDownGeneralSecondFaa(
                                  title: 'Kota',
                                  readOnly: true,
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (CityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(CityInputEvent(value));
                                  },
                                  initialItem: state.candidateDataModel !=
                                              null &&
                                          state.candidateDataModel?.city != 0
                                      ? state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.city
                                          ?.masterReference
                                          ?.where((element) =>
                                              element.id ==
                                              (state.candidateDataModel?.city ??
                                                  0))
                                          .toList()
                                          .first
                                      : null,
                                  items: listCity,
                                  errorText:
                                      isCheck == true && state.cityId.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "No Telepon",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(PhoneInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "No Handphone",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(HandphoneInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "Alamat Email",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(EmailInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<FaaCandidatePageBloc,
                                FaaCandidatePageState>(
                              buildWhen: (current, previous) =>
                                  current.occupationId !=
                                      previous.occupationId ||
                                  current.masterDataModel !=
                                      previous.masterDataModel,
                              builder: (context, state) {
                                return DropDownGeneralThirdFaa(
                                  readOnly: true,
                                  title: 'Profesi',
                                  icon: const Icon(
                                    Icons.work,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged:
                                      (CheckingstatusMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(OccupationInputEvent(value));
                                  },
                                  initialItem:
                                      state.candidateDataModel != null &&
                                              state.candidateDataModel
                                                      ?.occupation !=
                                                  0
                                          ? state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.occupationtype
                                              ?.masterReference
                                              ?.where((element) =>
                                                  element.id ==
                                                  (state.candidateDataModel
                                                          ?.occupation ??
                                                      0))
                                              .toList()
                                              .first
                                          : null,
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.occupationtype
                                          ?.masterReference ??
                                      [],
                                  errorText: isCheck == true &&
                                          state.occupationId.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            TextInput(
                              isMandatory: false,
                              icon: const Icon(Icons.person),
                              labelText: "Pekerjaan Sebelumnya",
                              onChanged: (String value) {
                                getIt<FaaCandidatePageBloc>().add(
                                    LastWorkingExperienceInputEvent(value));
                              },
                            ),
                            const SizedBox(height: 8),
                            CheckboxListTile(
                              title: const Text("Isi tanggal Pengunduran diri"),
                              value: checkedValueResign,
                              onChanged: (newValue) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(CheckedLastResignDateInputEvent(newValue??false));
                                setState(() {
                                  checkedValueResign = newValue ?? false;
                                });

                                ///todo
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            checkedValueResign
                                ? const SizedBox(height: 8)
                                : Container(),
                            checkedValueResign
                                ? DateTimePickerForm(
                                    dateTime: mode == Mode.update
                                        ? DateTime.now()
                                        : null,
                                    labelText: "Pilih Tanggal",
                                    title: "Tanggal pengunduran diri",
                                    errorText: isCheck == true &&
                                            state.dobPartner.isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                    isMandatory: checkedValueResign,
                                    selectedDateTime: (DateTime date) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(LastResignDateInputEvent(date));
                                    },
                                    validator: (String? value) {
                                      if (checkedValueResign) {
                                        if (value!.isNotEmpty) return null;
                                        return "Mohon diisi";
                                      } else {
                                        return null;
                                      }
                                    },
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                            CheckboxListTile(
                              title: const Text("Isi tanggal Terminasi"),
                              value: checkedValueTerminasi,
                              onChanged: (newValue) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(CheckedTerminationDateInputEvent(newValue??false));
                                setState(() {
                                  checkedValueTerminasi = newValue ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            checkedValueTerminasi
                                ? const SizedBox(height: 8)
                                : Container(),
                            checkedValueTerminasi
                                ? DateTimePickerForm(
                                    dateTime: mode == Mode.update
                                        ? DateTime.now()
                                        : null,
                                    labelText: "Pilih Tanggal",
                                    title: "Tanggal Terminasi",
                                    errorText: isCheck == true &&
                                            state.dobPartner.isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                    isMandatory: checkedValueTerminasi,
                                    selectedDateTime: (DateTime date) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(TerminationDateInputEvent(date));
                                    },
                                    validator: (String? value) {
                                      if (checkedValueTerminasi) {
                                        if (value!.isNotEmpty) return null;
                                        return "Mohon diisi";
                                      } else {
                                        return null;
                                      }
                                    },
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Foto Pribadi',
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(PrivateImageInputEvent(value));
                              },
                              errorText:
                                  isCheck && state.privateImage.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Foto KTP',
                              readOnly: state.identityImage.isValid,
                              initialImage: state.identityImage.value,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(IdentityImageInputEvent(value));
                              },
                              errorText:
                                  isCheck && state.identityImage.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Foto Selfie Beserta KTP',
                              readOnly: state.identitySelfieImage.isValid,
                              initialImage: state.identitySelfieImage.value,
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(IdentitySelfieImageInputEvent(value));
                              },
                              errorText: isCheck &&
                                      state.identitySelfieImage.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Surat Terminasi/Pengunduran Diri',
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(TerminationImageInputEvent(value));
                              },
                              errorText: isCheck &&
                                      state.terminationImage.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                            const SizedBox(height: 8),
                            CustomImagePicker(
                              title: 'Surat Tidak Melakukan Twisting',
                              onImagePicked: (value) {
                                getIt<FaaCandidatePageBloc>()
                                    .add(NotTwistingImageInputEvent(value));
                              },
                              errorText: isCheck &&
                                      state.notTwistingImage.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                            const SizedBox(height: 8),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
