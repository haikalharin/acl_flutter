import 'package:acl_flutter/core/widget/dropdown/drop_down_occupation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/custom_image_picker.dart';
import '../../../../../core/widget/date_time_picker_form.dart';
import '../../../../../core/widget/dropdown/drop_down_department.dart';
import '../../../../../core/widget/dropdown/drop_down_gender.dart';
import '../../../../../core/widget/dropdown/drop_down_kpm.dart';
import '../../../../../core/widget/dropdown/drop_down_marital_status.dart';
import '../../../../../core/widget/dropdown/drop_down_province.dart';
import '../../../../../core/widget/dropdown/drop_down_religion.dart';
import '../../../../../core/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../../../core/widget/dropdown/drop_down_city.dart';
import '../../../../../core/widget/dropdown/drop_down_country.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';

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
  bool isCheck = false;
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
                                TextInput(
                                  readOnly: true,
                                  icon: const Icon(Icons.person),
                                  label: const Text("Nama Depan(sesuai KTP)"),
                                  initialValue:
                                      state.candidateDataModel?.data?.firstName,
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
                                  initialValue: state
                                      .candidateDataModel?.data?.middleName,
                                  isMandatory: false,
                                  icon: const Icon(Icons.person),
                                  label: const Text("Nama tengah(sesuai KTP)"),
                                  onChanged: (String value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(MiddleNameInputEvent(value));
                                  },
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  readOnly: true,
                                  initialValue:
                                      state.candidateDataModel?.data?.lastName,
                                  isMandatory: false,
                                  icon: const Icon(Icons.person),
                                  label:
                                      const Text("Nama belakang(sesuai KTP)"),
                                  onChanged: (String value) {},
                                ),
                               
                                const SizedBox(height: 36),
                                BlocBuilder<FaaCandidatePageBloc,
                                    FaaCandidatePageState>(
                                  // buildWhen: (current, previous) =>
                                  //     current.provinceId != previous.provinceId ||
                                  //     current.masterDataModel !=
                                  //         previous.masterDataModel,
                                  builder: (context, state) {
                                    return DropDownDepartment(
                                      title: 'Jabatan',
                                      icon: const Icon(
                                        Icons.account_balance_rounded,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged:
                                          (AajicityMasterReference value) {
                                        // getIt<FaaCandidatePageBloc>()
                                        //     .add(ProvinceInputEvent(value));
                                      },
                                      items: state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.position
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
                                TextInput(
                                  readOnly: true,
                                  initialValue:
                                      state.candidateDataModel?.data?.idCardNo,
                                  icon: const Icon(Icons.add_card_rounded),
                                  label: const Text("No KTP"),
                                  maxLength: 16,
                                  keyboardType: TextInputType.phone,
                                  validator: (String? value) {
                                    if (state.identityNo.isNotValid) {
                                      return state.identityNo.invalidIdentityNo;
                                    }
                                    return null;
                                  },
                                  onChanged: (String value) {
                                    // getIt<FaaCandidatePageBloc>()
                                    //     .add(IdentityNoInputEvent(value));
                                  },
                                ),
                                const SizedBox(height: 36),
                                BlocBuilder<FaaCandidatePageBloc,
                                    FaaCandidatePageState>(
                                  // buildWhen: (current, previous) =>
                                  //     current.provinceId != previous.provinceId ||
                                  //     current.masterDataModel !=
                                  //         previous.masterDataModel,
                                  builder: (context, state) {
                                    return DropDownMaritalStatus(
                                      readOnly: true,
                                      title: 'Status Pernikahan',
                                      icon: const Icon(
                                        Icons.account_balance_rounded,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged:
                                          (AajicityMasterReference value) {
                                        // getIt<FaaCandidatePageBloc>()
                                        //     .add(ProvinceInputEvent(value));
                                      },
                                      initialItem: state.candidateDataModel !=
                                                  null &&
                                              state.candidateDataModel?.data
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
                                              state.provinceId.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                    );
                                  },
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  icon: const Icon(Icons.person),
                                  label: const Text("Tempat lahir"),
                                  // initialValue: postTitle,
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
                                DateTimePickerForm(
                                  dateTime: DateTime.parse(
                                    state.candidateDataModel?.data?.dob ??
                                        '2020-01-01',
                                  ),
                                  label: const Text("Pilih Tanggal"),
                                  title: "Tanggal lahir",
                                  errorText: isCheck == true &&
                                      state.dob.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                  selectedDateTime: (DateTime date) {
                                    var dateTime =
                                        "${date.year}-${date.month}-${date.day}";
                                    getIt<FaaCandidatePageBloc>()
                                        .add(DobInputEvent(dateTime));
                                  },
                                  validator: (String? value) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  },
                                ),
                                const SizedBox(height: 36),
                                DropDownGender(
                                  readOnly: true,
                                  title: 'Jenis kelamin',
                                  icon: const Icon(
                                    Icons.add_chart,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (AajicityMasterReference value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(GenderPartnerInputEvent(value));
                                  },
                                  initialItem:
                                      state.candidateDataModel != null &&
                                              state.candidateDataModel?.data
                                                      ?.gender !=
                                                  0
                                          ? state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.gender
                                              ?.masterReference
                                              ?.where((element) =>
                                                  element.id ==
                                                  (state.candidateDataModel
                                                          ?.data?.gender ??
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
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  icon: const Icon(Icons.person),
                                  label: const Text("Warga Negara"),
                                  // initialValue: postTitle,
                                  validator: (String? value) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  },
                                  onChanged: (String value) {
                                    getIt<FaaCandidatePageBloc>()
                                        .add(FirstNameInputEvent(value));
                                  },
                                ),
                                const SizedBox(height: 36),
                                BlocBuilder<FaaCandidatePageBloc,
                                    FaaCandidatePageState>(
                                  buildWhen: (current, previous) =>
                                      current.provinceId !=
                                          previous.provinceId ||
                                      current.masterDataModel !=
                                          previous.masterDataModel,
                                  builder: (context, state) {
                                    return DropDownReligion(
                                      title: 'Agama',
                                      icon: const Icon(
                                        Icons.account_balance_rounded,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged:
                                          (AajicityMasterReference value) {
                                        // getIt<FaaCandidatePageBloc>()
                                        //     .add(ProvinceInputEvent(value));
                                      },
                                      items: state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.religion
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
                                TextInput(
                                  readOnly: true,
                                  title: Row(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          child: const Text(
                                              'Alamat rumah (sesuai KTP)',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color:
                                                    AclColors.greyDarkFontColor,
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
                                  initialValue:
                                      state.candidateDataModel?.data?.address1,
                                  icon: const Icon(Icons.add_location),
                                  label: const Text("(Gedung.../Jalan...)"),
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
                                  readOnly: true,
                                  initialValue:
                                      state.candidateDataModel?.data?.address2,
                                  icon: const Icon(Icons.add_location),
                                  label: const Text("(RT.../RW...)"),
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
                                  readOnly: true,
                                  initialValue:
                                      state.candidateDataModel?.data?.address3,
                                  icon: const Icon(Icons.add_location),
                                  label:
                                      const Text("(Kelurahan.../Kecamatan...)"),
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
                                  initialValue: state
                                      .candidateDataModel?.data?.zipCode
                                      .toString(),
                                  icon: const Icon(Icons.signpost_sharp),
                                  label: const Text("Kode Pos"),
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
                                    return DropDownCountry(
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
                                          ?.where(
                                              (element) => element.id == 744)
                                          .toList()
                                          .first,
                                      items: state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.country
                                              ?.masterReference
                                              ?.where((element) =>
                                                  element.id == 744)
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
                                      current.provinceId !=
                                          previous.provinceId ||
                                      current.masterDataModel !=
                                          previous.masterDataModel,
                                  builder: (context, state) {
                                    return DropDownProvince(
                                      readOnly: true,
                                      title: 'Provinsi',
                                      icon: const Icon(
                                        Icons.account_balance_rounded,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged:
                                          (AajicityMasterReference value) {
                                        getIt<FaaCandidatePageBloc>()
                                            .add(ProvinceInputEvent(value));
                                      },
                                      initialItem: state.candidateDataModel !=
                                                  null &&
                                              state.candidateDataModel?.data
                                                      ?.province !=
                                                  0
                                          ? state
                                              .masterDataModel
                                              ?.masterData
                                              ?.masterReferenceAll
                                              ?.province
                                              ?.masterReference
                                              ?.where((element) =>
                                                  element.id ==
                                                  (state.candidateDataModel
                                                          ?.data?.province ??
                                                      0))
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
                                      current.provinceId !=
                                          previous.provinceId ||
                                      current.masterDataModel !=
                                          previous.masterDataModel ||
                                      current.candidateDataModel !=
                                          previous.candidateDataModel,
                                  builder: (context, state) {
                                    List<CityMasterReference> listCity =
                                        state.candidateDataModel?.data?.province != 0
                                            ? state
                                                    .masterDataModel
                                                    ?.masterData
                                                    ?.masterReferenceAll
                                                    ?.city
                                                    ?.masterReference
                                                    ?.where((element) =>
                                                        element.referTo ==
                                                        state.candidateDataModel
                                                            ?.data?.province)
                                                    .toList() ??
                                                []
                                            : state
                                                    .masterDataModel
                                                    ?.masterData
                                                    ?.masterReferenceAll
                                                    ?.city
                                                    ?.masterReference
                                                    ?.where((element) =>
                                                        element.referTo == state.provinceId.value)
                                                    .toList() ??
                                                [];
                                    return DropDownCity(
                                      title: 'Kota',
                                      readOnly: true,
                                      // readOnly: state.provinceId.isValid ||
                                      //         state.candidateDataModel?.data
                                      //                 ?.city !=
                                      //             null
                                      //     ? false
                                      //     : true,
                                      icon: const Icon(
                                        Icons.account_balance_rounded,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged: (CityMasterReference value) {
                                        getIt<FaaCandidatePageBloc>()
                                            .add(CityInputEvent(value));
                                      },
                                      initialItem:
                                      state.candidateDataModel !=
                                          null &&
                                          state.candidateDataModel?.data
                                              ?.city !=
                                              0
                                          ? state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.city
                                          ?.masterReference
                                          ?.where((element) =>
                                      element.id ==
                                          (state.candidateDataModel
                                              ?.data?.city ??
                                              0))
                                          .toList()
                                          .first
                                          : null,
                                      items: listCity,
                                      errorText: isCheck == true &&
                                              state.cityId.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                    );
                                  },
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  isMandatory: false,
                                  icon: const Icon(Icons.person),
                                  label: const Text("No Telepon"),
                                  onChanged: (String value) {},
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  isMandatory: false,
                                  icon: const Icon(Icons.person),
                                  label: const Text("No Handphone"),
                                  onChanged: (String value) {},
                                ),
                                const SizedBox(height: 8),
                                TextInput(
                                  isMandatory: false,
                                  icon: const Icon(Icons.person),
                                  label: const Text("Alamat Email"),
                                  onChanged: (String value) {},
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
                                    return DropDownOccupation(
                                      readOnly: true,
                                      title: 'Profesi',
                                      icon: const Icon(
                                        Icons.work,
                                        color: AclColors.greyDarkFontColor,
                                      ),
                                      onChanged: (CheckingstatusMasterReference
                                          value) {
                                        getIt<FaaCandidatePageBloc>()
                                            .add(OccupationInputEvent(value));
                                      },
                                      initialItem: state.candidateDataModel !=
                                                  null &&
                                              state.candidateDataModel?.data
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
                                                          ?.data?.occupation ??
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
                                  label: const Text("Pekerjaan Sebelumnya"),
                                  onChanged: (String value) {},
                                ),
                                const SizedBox(height: 8),
                                CheckboxListTile(
                                  title: const Text(
                                      "Isi tanggal Pengunduran diri"),
                                  value: checkedValueResign,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValueResign = newValue ?? false;
                                    });

                                    // getIt<FaaCandidatePageBloc>().add(
                                    //     MarriedCheckedInputEvent(newValue ?? false));
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
                                        label: const Text("Pilih Tanggal"),
                                        title: "Tanggal pengunduran diri",
                                  errorText: isCheck == true &&
                                      state.dobPartner.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                        isMandatory: checkedValueResign,
                                        selectedDateTime: (DateTime date) {
                                          var dateTime =
                                              "${date.year}-${date.month}-${date.day}";
                                          getIt<FaaCandidatePageBloc>().add(
                                              DobPartnerInputEvent(dateTime));
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
                                    setState(() {
                                      checkedValueTerminasi = newValue ?? false;
                                    });

                                    // getIt<FaaCandidatePageBloc>().add(
                                    //     MarriedCheckedInputEvent(newValue ?? false));
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
                                        label: const Text("Pilih Tanggal"),
                                        title: "Tanggal Terminasi",
                                  errorText: isCheck == true &&
                                      state.dobPartner.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                        isMandatory: checkedValueTerminasi,
                                        selectedDateTime: (DateTime date) {
                                          var dateTime =
                                              "${date.year}-${date.month}-${date.day}";
                                          getIt<FaaCandidatePageBloc>().add(
                                              DobPartnerInputEvent(dateTime));
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
                                        .add(IdentityImageInputEvent(value));
                                  },
                                  errorText:
                                      isCheck && state.identityImage.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                ),
                                const SizedBox(height: 8),
                                CustomImagePicker(
                                  title: 'Foto KTP',
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
                                  onImagePicked: (value) {
                                    getIt<FaaCandidatePageBloc>().add(
                                        IdentitySelfieImageInputEvent(value));
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
                                    getIt<FaaCandidatePageBloc>().add(
                                        IdentitySelfieImageInputEvent(value));
                                  },
                                  errorText: isCheck &&
                                          state.identitySelfieImage.isNotValid
                                      ? 'Mohon diisi'
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                CustomImagePicker(
                                  title: 'Surat Tidak Melakukan Twisting',
                                  onImagePicked: (value) {
                                    getIt<FaaCandidatePageBloc>().add(
                                        IdentitySelfieImageInputEvent(value));
                                  },
                                  errorText: isCheck &&
                                          state.identitySelfieImage.isNotValid
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
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
