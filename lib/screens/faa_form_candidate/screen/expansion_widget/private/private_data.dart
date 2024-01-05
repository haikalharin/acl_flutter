import 'package:acl_flutter/common/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/widget/custom_image_picker.dart';
import '../../../../../core/widget/date_time_picker_form.dart';
import '../../../../../core/widget/dropdown/drop_down_department.dart';
import '../../../../../core/widget/dropdown/drop_down_gender.dart';
import '../../../../../core/widget/dropdown/drop_down_kpm.dart';
import '../../../../../core/widget/dropdown/drop_down_marriage.dart';
import '../../../../../core/widget/dropdown/drop_down_province.dart';
import '../../../../../core/widget/dropdown/drop_down_religion.dart';
import '../../../../../core/widget/spinkit_indicator.dart';
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
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAUI = false;
  bool checkedValueMarriage = false;
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
    return  SingleChildScrollView(
      child: Card(
        child: ExpansionTile(
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
                                controller: firstName,
                                icon: const Icon(Icons.person),
                                label: const Text("Nama Depan(sesuai KTP)"),
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
                              TextInput(
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
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("Nama belakang(sesuai KTP)"),
                                onChanged: (String value) {

                                },
                              ),

                              const SizedBox(height: 8),
                              CheckboxListTile(
                                title: const Text("KPM/Location agency sama dengan perekrut"),
                                value: checkedValueKpm,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueKpm = newValue ?? false;
                                  });

                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),

                              const SizedBox(height: 8),
                              BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                buildWhen: (current, previous) =>
                                current.provinceId != previous.provinceId ||
                                    current.masterDataModel !=
                                        previous.masterDataModel,
                                builder: (context, state) {
                                  return DropDownKpm(
                                    title: 'KPM',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      // getIt<FaaCandidatePageBloc>()
                                      //     .add(ProvinceInputEvent(value));
                                    },
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
                              TextInput(
                                controller: firstName,
                                icon: const Icon(Icons.person),
                                label: const Text("Distribution type"),
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
                              TextInput(
                                icon: const Icon(Icons.person),
                                label: const Text("Nama BDE"),
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
                              TextInput(
                                icon: const Icon(Icons.person),
                                label: const Text("Kode Region"),
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
                                dateTime:
                                mode == Mode.create ? DateTime.now() : null,
                                label: const Text("Tanggal lahir"),
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
                              const SizedBox(height: 8),
                              BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                buildWhen: (current, previous) =>
                                current.provinceId != previous.provinceId ||
                                    current.masterDataModel !=
                                        previous.masterDataModel,
                                builder: (context, state) {
                                  return DropDownDepartment(
                                    title: 'Jabatan',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      // getIt<FaaCandidatePageBloc>()
                                      //     .add(ProvinceInputEvent(value));
                                    },
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
                              TextInput(
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
                                buildWhen: (current, previous) =>
                                current.provinceId != previous.provinceId ||
                                    current.masterDataModel !=
                                        previous.masterDataModel,
                                builder: (context, state) {
                                  return DropDownMarriage(
                                    title: 'Status Pernikahan',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      // getIt<FaaCandidatePageBloc>()
                                      //     .add(ProvinceInputEvent(value));
                                    },
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
                                dateTime:
                                mode == Mode.update ? DateTime.now() : null,
                                label: const Text("Tanggal lahir"),
                                selectedDateTime: (DateTime date) {
                                  var dateTime =
                                      "${date.year}-${date.month}-${date.day}";
                                  // getIt<FaaCandidatePageBloc>()
                                  //     .add(DobInputEvent(dateTime));
                                },
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                              ),
                              const SizedBox(height: 36),
                              DropDownGender(
                                title: 'Jenis kelamin',
                                isMandatory: checkedValueMarriage,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (AajicityMasterReference value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(GenderPartnerInputEvent(value));
                                },
                                items: state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.gender
                                    ?.masterReference ??
                                    [],
                                errorText:  isCheck &&
                                    state.genderId.isNotValid
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
                                current.provinceId != previous.provinceId ||
                                    current.masterDataModel !=
                                        previous.masterDataModel,
                                builder: (context, state) {
                                  return DropDownReligion(
                                    title: 'Agama',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      // getIt<FaaCandidatePageBloc>()
                                      //     .add(ProvinceInputEvent(value));
                                    },
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
                              TextInput(
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
                                        margin: const EdgeInsets.only(left: 5, bottom: 5),
                                        child: const Text(
                                          '*',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: AclColors.redAccent,
                                          ),
                                        ))
                                  ],
                                ),
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
                                icon: const Icon(Icons.add_location),
                                label: const Text("(Kelurahan.../Kecamatan...)"),
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
                                        ?.where((element) => element.id == 744)
                                        .toList()
                                        .first,
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.country
                                        ?.masterReference
                                        ?.where((element) => element.id == 744)
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
                                  return DropDownProvince(
                                    title: 'Provinsi',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(ProvinceInputEvent(value));
                                    },
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
                                        previous.masterDataModel,
                                builder: (context, state) {
                                  return DropDownCity(
                                    title: 'Kota',
                                    readOnly:
                                    state.provinceId.isValid ? false : true,
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (CityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(CityInputEvent(value));
                                    },
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.city
                                        ?.masterReference
                                        ?.where((element) =>
                                    element.referTo ==
                                        state.provinceId.value)
                                        .toList() ??
                                        [],
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
                                label: const Text("No Telepon"),
                                onChanged: (String value) {

                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("No Handphone"),
                                onChanged: (String value) {

                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("Alamat Email"),
                                onChanged: (String value) {

                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("Pekerjaan"),
                                onChanged: (String value) {

                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("Pekerjaan Sebelumnya"),
                                onChanged: (String value) {

                                },
                              ),
                              const SizedBox(height: 8),
                              CheckboxListTile(
                                title: const Text("Isi tanggal Pengunduran diri"),
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
                              checkedValueResign?const SizedBox(height: 8):Container(),
                              checkedValueResign?DateTimePickerForm(
                                dateTime:
                                mode == Mode.update ? DateTime.now() : null,
                                label: const Text("Tanggal pengunduran diri"),
                                isMandatory: checkedValueMarriage,
                                selectedDateTime: (DateTime date) {
                                  var dateTime =
                                      "${date.year}-${date.month}-${date.day}";
                                  getIt<FaaCandidatePageBloc>()
                                      .add(DobPartnerInputEvent(dateTime));
                                },
                                validator: (String? value) {
                                  if (checkedValueMarriage) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  } else {
                                    return null;
                                  }
                                },
                              ):Container(),
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
                              checkedValueTerminasi?const SizedBox(height: 8):Container(),
                              checkedValueTerminasi?DateTimePickerForm(
                                dateTime:
                                mode == Mode.update ? DateTime.now() : null,
                                label: const Text("Tanggal Terminasi"),
                                isMandatory: checkedValueMarriage,
                                selectedDateTime: (DateTime date) {
                                  var dateTime =
                                      "${date.year}-${date.month}-${date.day}";
                                  getIt<FaaCandidatePageBloc>()
                                      .add(DobPartnerInputEvent(dateTime));
                                },
                                validator: (String? value) {
                                  if (checkedValueMarriage) {
                                    if (value!.isNotEmpty) return null;
                                    return "Mohon diisi";
                                  } else {
                                    return null;
                                  }
                                },
                              ):Container(),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Foto Pribadi',
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(IdentityImageInputEvent(value));
                                },
                                errorText:  isCheck &&
                                    state.identityImage.isNotValid
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
                                errorText:  isCheck &&
                                    state.identityImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Foto Selfie Beserta KTP',
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(IdentitySelfieImageInputEvent(value));
                                },
                                errorText:  isCheck &&
                                    state.identitySelfieImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Surat Terminasi/Pengunduran Diri',
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(IdentitySelfieImageInputEvent(value));
                                },
                                errorText:  isCheck &&
                                    state.identitySelfieImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Surat Tidak Melakukan Twisting',
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(IdentitySelfieImageInputEvent(value));
                                },
                                errorText:  isCheck &&
                                    state.identitySelfieImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        state.submitStatus.isInProgress
                            ? const Center(
                            child: SpinKitIndicator(type: SpinKitType.circle))
                            : Container(),

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
